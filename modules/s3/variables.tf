variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "default-tf-bucket-name"
}

variable "bucket_tag_name" {
  description = "The name tag for the S3 bucket"
  type        = string
  default     = "Default Bucket Tag"
}

variable "block_public_acls" {
  description = "Whether to block public ACLs"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Whether to block public bucket policies"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether to ignore public ACLs"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether to restrict public buckets"
  type        = bool
  default     = true
}

variable "cloudfront_distribution_id" {
  type        = string
  description = "CloudFront distribution ID"
}

variable "policy_type" {
  description = "access type wheather its a cloudfront or iam user"
  type        = string
  default = "public_iam"
}
