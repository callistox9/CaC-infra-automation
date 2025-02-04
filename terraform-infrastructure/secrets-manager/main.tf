locals {
  sm_additional_tags = {
    customer_critical = "true"
  }
}

module "secrets_manager" {
  source  = "terraform-aws-modules/secrets-manager/aws"
   version = "1.3.0"  
   for_each = var.sm_config
   name          = try("${var.region_short}-${var.environment_name}-${each.value.sm_name_suffix}", null)
   description   = try(each.value.description,null) 
   
   secret_string = jsonencode(try(each.value.secret_string_map, {}))

  kms_key_id = try(each.value.kms_key_id, null)
  tags = merge(
    local.common_tags,
    local.sm_additional_tags
  )
}
