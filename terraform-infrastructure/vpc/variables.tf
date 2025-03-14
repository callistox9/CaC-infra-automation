# TODO - Use modular approach only when multiple resources are being created with similar configurations. Add variables and then remove the defaults. Placce the variables in the infrastructure module.

variable "vpc_configs" {
  description = "vpc_configs"
  type        = any
  default     = {}
}


# VPC Input Variables

# VPC Name
# variable "vpc_name" {
#   description = "VPC Name"
#   type = string 
# }

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.100.0.0/16"
}

# VPC Availability Zones
/*
variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}
*/

# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type        = list(string)
  default     = ["10.100.101.0/24", "10.100.102.0/24"]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type        = list(string)
  default     = ["10.100.1.0/24", "10.100.2.0/24"]
}


# VPC Enable NAT Gateway (True or False) 
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
  type        = bool
  default     = true
}

# VPC Single NAT Gateway (True or False)
variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs during our demos"
  type        = bool
  default     = true
}






