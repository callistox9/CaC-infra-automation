module "vpc-endpoints" {
  source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  for_each = var.vpc_endpoint_configs
  vpc_id             = try(each.value.vpc_id, null)
  security_group_ids = try(each.value.security_group_ids, null)

  endpoints = try(each.value.endpoints, null)

  tags = merge(
    local.common_tags
  )
}