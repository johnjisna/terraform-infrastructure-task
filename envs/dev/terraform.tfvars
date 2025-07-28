vpc_name            = "my-vpc"
image_id            = "ami-020cba7c55df1f615"
instance_type       = "t2.micro"


vpc_cidr = "10.0.0.0/16"

availability_zones = ["us-east-1a", "us-east-1b"]

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.3.0/24",
  "10.0.4.0/24"
]


name                        = "devdb"
username                    = "postgresadmin"
password                    = "Admin12345"
db_name                     = "sampledb"
engine                      = "postgres"
engine_version              = "17.5"
instance_class              = "db.t3.micro"
allocated_storage           = 20

publicly_accessible         = false
multi_az                    = false
skip_final_snapshot         = false
deletion_protection         = false
backup_retention_period     = 7
auto_minor_version_upgrade  = false
maintenance_window          = "Mon:00:00-Mon:03:00"

ecr_repository_name      = "test-ecr-repo"
ecr_scan_on_push         = true
ecr_image_tag_mutability = "IMMUTABLE"
environment              = "dev"
project                  = "test"

secret_name        = "test-dev-secret-version-11"
secret_description = "Database credentials for updated application"
secret_values = {
  username = "postgresadmin"
  password = "Admin12345"
}

acm_certificate_arn = ""
custom_domain_name  = ""
policy_name         = "test-s3-iam-user-policy"
policy_type         = "cloudfront"
bucket_name         = "test-dev-bucket-123987"

iam_instance_role_name = "test-role"
trusted_services       = ["ec2.amazonaws.com"]

lb_name = "test-alb"

tg_port     = 80
tg_protocol = "HTTP"

tg_health_check_interval = 30
tg_health_check_timeout  = 5
tg_healthy_threshold     = 2
tg_unhealthy_threshold   = 2

target_group_configs = {
  tg-public = {
    health_check_path      = "/"
    matcher                = "200"
    listener_priority      = 200
    listener_path_patterns = ["/"]
  }

  tg-private = {
    health_check_path      = "/"
    matcher                = "200,301"
    listener_priority      = 100
    listener_path_patterns = ["/api/*"]
  }
}


scale_min_size         = 1
scale_max_size         = 2
scale_desired_capacity = 1
scale_target_cpu       = 50


