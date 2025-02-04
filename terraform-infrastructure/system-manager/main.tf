locals {
  
  sm_additional_tags = {
    customer_critical = "true"
  }

}
resource "aws_ssm_parameter" "system_manager_param_store" {
  for_each = var.sm_config

  
  name        = try("/${each.value.backend_service}/${var.region_short}/${var.environment_name}/${each.value.secret_token_name}", null)
  value       = try(each.value.value, null)
  type        = try(each.value.type, "String")  # Default to "String" if not specified
  description = try(each.value.description, "SSM Parameter managed by Terraform")
  tier        = try(each.value.tier, "Standard")
  data_type   = try(each.value.data_type, "text")

  
  key_id      = each.value.type == "SecureString" ? try(each.value.kms_key_alias, null) : null
  overwrite = true

  lifecycle {
    create_before_destroy = false # Does not accept dynamic try function or any dynamic evaluation in the lifecycle block as it is not supported.
  }
  tags = merge(
    local.common_tags,
    local.sm_additional_tags
  )
}

