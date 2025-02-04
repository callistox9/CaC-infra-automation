locals {
  additional_tags = {
    customer_critical = "false"
  }
}


# effibuild security group
# Doc here
# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  for_each = var.security_group_configs

  # name        = local.security_group_name
  name        = try("${var.region_short}-${var.environment_name}-${each.value.security_group_name_suffix}", null)
  description = try(each.value.security_group_description, null)
  # vpc_id      = module.vpc.vpc_id
  vpc_id      = try(each.value.vpc_id, null)

  egress_rules    = try(each.value.security_group_egress_rules, null)
  use_name_prefix = try(each.value.security_group_use_name_prefix, false)

  ingress_with_cidr_blocks = try(each.value.ingress_with_cidr_blocks, null)
  ingress_with_self = try(each.value.ingress_with_self, null)

  tags = merge(
    local.common_tags,
    local.additional_tags
  )
}
