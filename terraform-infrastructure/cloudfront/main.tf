locals {
  cdn_additional_tags = {
    customer_critical = "true"
  }
  cdn_helpers_additional_tags = {
    customer_critical = "false"
  }
}

#Doc -- https://github.com/terraform-aws-modules/terraform-aws-cloudfront 
module "cdn" {
  source = "terraform-aws-modules/cloudfront/aws"
  for_each = var.cdn_configs

  comment             = try("${var.region_short}-${var.environment_name}-${each.value.cloudfront_name_suffix}", null)
  
  is_ipv6_enabled     = try(each.value.is_ipv6_enabled, false) 
  price_class         = try(each.value.price_class, "PriceClass_All") 
  retain_on_delete    = try(each.value.retain_on_delete, false)
  wait_for_deployment = try(each.value.wait_for_deployment, false)

  aliases = try(each.value.aliases, []) 
  default_root_object = try(each.value.default_root_object, "index.html") 
  viewer_certificate = try(each.value.viewer_certificate, {})


  create_origin_access_identity = try(each.value.create_origin_access_identity, true)
  create_distribution           = try(each.value.create_distribution, true)
  origin_access_control         = try(each.value.origin_access_control, {})

  origin = try(each.value.origin, {})

  default_cache_behavior = try(each.value.default_cache_behavior, {})

  ordered_cache_behavior = try(each.value.ordered_cache_behavior, [])
  custom_error_response = try(each.value.custom_error_response, []) 


  tags = merge(
    local.common_tags,
    local.cdn_additional_tags
  )
}

