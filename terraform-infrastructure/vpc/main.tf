
locals {
  # for_each = var.vpc_configs
  # vpc_name = try("${var.region_short}-${var.environment_name}-${each.value.vpc_name_suffix}", null)
  vpc_additional_tags = {
    customer_critical = "true"
  }
  vpc_helpers_additional_tags = {
    customer_critical = "false"
  }
}
# inputs = {
#   vpc_name = local.vpc_name
# }
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
# https://github.com/terraform-aws-modules/terraform-aws-vpc/tree/master/examples/complete

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.12.1"

  for_each = var.vpc_configs

  name            = try("${var.region_short}-${var.environment_name}-${each.value.vpc_name_suffix}", null)
  cidr            = try(each.value.vpc_cidr_block, null)
  azs             = slice(data.aws_availability_zones.available.names, 0, 3)
  public_subnets  = try(each.value.vpc_public_subnets, null)
  private_subnets = try(each.value.vpc_private_subnets, null)
  
  create_multiple_intra_route_tables = try(each.value.create_multiple_intra_route_tables, false)
  create_multiple_public_route_tables = try(each.value.create_multiple_public_route_tables, false)


  enable_nat_gateway           = try(each.value.vpc_enable_nat_gateway, true)
  single_nat_gateway = try(each.value.single_nat_gateway, false)
  
  enable_dns_hostnames = try(each.value.enable_dns_hostnames, true)
  enable_dns_support   = try(each.value.enable_dns_support, true)

  tags = merge(
    local.common_tags,
    local.vpc_additional_tags
  )
}
