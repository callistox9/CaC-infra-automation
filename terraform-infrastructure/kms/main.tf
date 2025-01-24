locals {
  kms_additional_tags = {
    customer_critical = "true"
  }
}


# https://registry.terraform.io/modules/terraform-aws-modules/kms/aws/latest
# https://github.com/terraform-aws-modules/terraform-aws-kms/tree/master/examples/complete



module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "3.1.0"
  for_each = var.kms_configs
  description         = "AWS KMS Key specially for the specific account"
  is_enabled          = try(each.value.kms_is_enabled)
  enable_key_rotation = try(each.value.kms_enable_key_rotation) # var.kms_enable_key_rotation
  create_external     = try(each.value.kms_create_external)     # var.kms_create_external
  key_usage           = try(each.value.kms_key_usage)           # var.kms_key_usage

  # assign users to manage and use the key
  key_owners         = ["arn:aws:iam::${var.account_id}:root"]
  key_administrators = ["arn:aws:iam::${var.account_id}:root"]
  key_users          = ["arn:aws:iam::${var.account_id}:root"]

  # each key can have multiple aliases with different permissions
  aliases                 = try(each.value.kms_aliases) # var.kms_aliases
  aliases_use_name_prefix = try(each.value.kms_aliases_use_name_prefix) # var.kms_aliases_use_name_prefix

  multi_region          = try(each.value.kms_multi_region) # var.kms_multi_region
  enable_default_policy = try(each.value.kms_enable_default_policy) # var.kms_enable_default_policy # adds a default policy to the key, allows current account to manage the key, allow everyone & everything in the account to use the key
  #   deletion_window_in_days = 30  # maximum deletion day for safety

  tags = merge(
    local.common_tags,
    local.kms_additional_tags
  )

}
