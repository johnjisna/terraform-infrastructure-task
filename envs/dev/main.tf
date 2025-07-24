module "vpc" {
  source               = "../../modules/vpc"
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}



module "alb" {
  source = "../../modules/alb"

  lb_name             = var.lb_name
  subnet_ids          = module.vpc.public_subnet_ids
  vpc_id              = module.vpc.vpc_id
  alb_sg_id           = module.sg.alb_sg_id

  tg_port                  = var.tg_port
  tg_protocol              = var.tg_protocol
  tg_health_check_interval = var.tg_health_check_interval
  tg_health_check_timeout  = var.tg_health_check_timeout
  tg_healthy_threshold     = var.tg_healthy_threshold
  tg_unhealthy_threshold   = var.tg_unhealthy_threshold

  target_group_configs = var.target_group_configs
}

module "ec2" {
  source = "../../modules/ec2"

  ec2_configs = {
    public = {
      image_id          = var.image_id
      instance_type     = var.instance_type
      sg_id             = module.sg.ec2_public_sg_id
      subnet_ids        = module.vpc.public_subnet_ids
      target_group_arns = [module.alb.target_group_arn_public]
      desired_capacity  = var.scale_desired_capacity
      min_size          = var.scale_min_size
      max_size          = var.scale_max_size
      key_name          = "test-key"
      user_data         = <<-EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get install -y nginx
        sudo systemctl start nginx
        sudo systemctl enable nginx
        echo "Hello from $(hostname)" | sudo tee /var/www/html/index.html
      EOF
      iam_instance_profile = module.iam_instance_profile.iam_instance_profile_name
    }

    private = {
      image_id          = var.image_id
      instance_type     = var.instance_type
      sg_id             = module.sg.ec2_private_sg_id
      subnet_ids        = module.vpc.private_subnet_ids
      target_group_arns = [module.alb.target_group_arn_private]
      desired_capacity  = var.scale_desired_capacity
      min_size          = var.scale_min_size
      max_size          = var.scale_max_size
      key_name          = "test-key"
      user_data         = <<-EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get install -y nginx
        sudo systemctl start nginx
        sudo systemctl enable nginx
        echo "Hello from $(hostname)" | sudo tee /var/www/html/index.html
      EOF
      iam_instance_profile = module.iam_instance_profile.iam_instance_profile_name
    }
  }
}


module "sg" {
  source    = "../../modules/sg"
  vpc_id    = module.vpc.vpc_id
  vpc_cidr  = var.vpc_cidr
  name      = var.name
}


module "rds_postgres" {
  source                   = "../../modules/rds"
  name                     = var.name
  username                 = var.username
  password                 = var.password
  db_name                  = var.db_name
  engine                   = var.engine
  engine_version           = var.engine_version
  instance_class           = var.instance_class
  allocated_storage        = var.allocated_storage
  vpc_id                   = module.vpc.vpc_id
  sg_id                    = module.sg.db_sg_id  
  subnet_ids               = module.vpc.private_subnet_ids    

  publicly_accessible      = var.publicly_accessible
  multi_az                 = var.multi_az
  skip_final_snapshot      = var.skip_final_snapshot
  deletion_protection      = var.deletion_protection
  backup_retention_period  = var.backup_retention_period

  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  maintenance_window       = var.maintenance_window
}

module "ecr" {
  source = "../../modules/ecr"

  repository_name      = var.ecr_repository_name
  scan_on_push         = var.ecr_scan_on_push
  image_tag_mutability = var.ecr_image_tag_mutability
  tags = {
    Environment = var.environment
    Project     = var.project
  }
}


module "secrets" {
  source        = "../../modules/secrets"
  secret_name   = var.secret_name
  description   = var.secret_description
  secret_values = var.secret_values
}


module "s3" {
  source                     = "../../modules/s3"
  bucket_name                = var.bucket_name
  cloudfront_distribution_id = module.cdn.cloudfront_distribution_id
  policy_type                = var.policy_type

}

module "cdn" {

  source                      = "../../modules/cdn"
  bucket_regional_domain_name = module.s3.bucket_regional_domain_name
  custom_domain_name          = var.custom_domain_name
  acm_certificate_arn         = var.acm_certificate_arn
}

module "iam_instance_profile" {
  source           = "../../modules/iam"
  iam_role_name    = var.iam_instance_role_name
  trusted_services = var.trusted_services

  iam_policies = {
    "s3-read-write-policy"     = "policies/s3_policy.json",
    "ecr-pull-policy"          = "policies/ecr-read-policy.json",
    "secretsmanager-readonly"  = "policies/secret-manager-policy.json"
  }

  role_policy_mapping = {
    "s3-read-write-policy"     = module.s3.bucket_arn,
    "ecr-pull-policy"          = module.ecr.repository_arn,
    "secretsmanager-readonly"  = module.secrets.secret_arn
  }

  resource_arn_mapping = {
    "s3-read-write-policy"     = module.s3.bucket_arn,
    "ecr-pull-policy"          = module.ecr.repository_arn,
    "secretsmanager-readonly"  = module.secrets.secret_arn
  }
}

