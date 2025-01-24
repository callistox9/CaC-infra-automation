# All outputs are not added

output "vpc_azs" {
  description = "A list of availability zones spefified as argument to this module"
  value = {
    for k, v in module.vpc : k => v.azs
  }
}

output "vpc_id" {
  description = "The ID of the VPC"
  value = {
    for k, v in module.vpc : k => v.vpc_id
  }
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value = {
    for k, v in module.vpc : k => v.vpc_arn
  }
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value = {
    for k, v in module.vpc : k => v.vpc_cidr_block
  }
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value = {
    for k, v in module.vpc : k => v.default_security_group_id
  }
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL"
  value = {
    for k, v in module.vpc : k => v.default_network_acl_id
  }
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value = {
    for k, v in module.vpc : k => v.default_route_table_id
  }
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value = {
    for k, v in module.vpc : k => v.vpc_instance_tenancy
  }
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value = {
    for k, v in module.vpc : k => v.vpc_enable_dns_support
  }
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value = {
    for k, v in module.vpc : k => v.vpc_enable_dns_hostnames
  }
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value = {
    for k, v in module.vpc : k => v.vpc_main_route_table_id
  }
}

output "vpc_ipv6_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value = {
    for k, v in module.vpc : k => v.vpc_ipv6_association_id
  }
}

output "vpc_ipv6_cidr_block" {
  description = "The IPv6 CIDR block"
  value = {
    for k, v in module.vpc : k => v.vpc_ipv6_cidr_block
  }
}

output "vpc_secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks of the VPC"
  value = {
    for k, v in module.vpc : k => v.vpc_secondary_cidr_blocks
  }
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value = {
    for k, v in module.vpc : k => v.vpc_owner_id
  }
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value = {
    for k, v in module.vpc : k => v.private_subnets
  }
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value = {
    for k, v in module.vpc : k => v.private_subnet_arns
  }
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value = {
    for k, v in module.vpc : k => v.private_subnets_cidr_blocks
  }
}

output "private_subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of private subnets in an IPv6 enabled VPC"
  value = {
    for k, v in module.vpc : k => v.private_subnets_ipv6_cidr_blocks
  }
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value = {
    for k, v in module.vpc : k => v.public_subnets
  }
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value = {
    for k, v in module.vpc : k => v.public_subnet_arns
  }
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value = {
    for k, v in module.vpc : k => v.public_subnets_cidr_blocks
  }
}

output "public_subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of public subnets in an IPv6 enabled VPC"
  value = {
    for k, v in module.vpc : k => v.public_subnets_ipv6_cidr_blocks
  }
}

