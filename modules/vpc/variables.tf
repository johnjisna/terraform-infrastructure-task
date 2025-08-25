variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "main-vpc"
}

variable "public_subnet_name_prefix" {
  description = "Prefix for public subnet Name tags"
  type        = string
  default     = "public-subnet"
}

variable "private_subnet_name_prefix" {
  description = "Prefix for private subnet Name tags"
  type        = string
  default     = "private-subnet"
}

variable "nat_eip_name_prefix" {
  description = "Prefix for NAT EIP Name tags"
  type        = string
  default     = "nat-eip"
}

variable "nat_gateway_name_prefix" {
  description = "Prefix for NAT Gateway Name tags"
  type        = string
  default     = "nat-gateway"
}

variable "igw_name" {
  description = "Name tag for Internet Gateway"
  type        = string
  default     = "main-igw"
}

variable "public_route_table_name" {
  description = "Name tag for public route table"
  type        = string
  default     = "public-rt"
}

variable "private_route_table_name_prefix" {
  description = "Prefix for private route table Name tags"
  type        = string
  default     = "private-rt"
}

