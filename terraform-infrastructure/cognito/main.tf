
## This Cognito-pool configuration is like the be-user-pool comfiguration in the us (n. virginia region)
#TODo -- Required Attribute is "updated_at" or email is not being configured. configure it.
# TOd0 -- Read all values from the config file
#eletion Protection Active

locals {
  cognito_additional_tags = {
    
    customer_critical = "true"
  }
}
module "cognito-user-pool" {
  source  = "lgallard/cognito-user-pool/aws"
  version = "0.31.0"
  for_each = var.cognito_pool_configs
  
  user_pool_name = try("${var.region_short}-${var.environment_name}-${each.value.cognito_name_suffix}", null)
   

  
  username_attributes     = try(each.value.username_attributes, [])#["email"]
  auto_verified_attributes = try(each.value.auto_verified_attributes, [])#["email"]

  mfa_configuration = try(each.value.mfa, "OFF")

# DOC -- refer to this module git-repo for updated_at Required Attribute and additional information
#        https://github.com/lgallard/terraform-aws-cognito-user-pool >> ReadMe.md Comple exmaple                       


    string_schemas = try(each.value.string_schemas, [])

    number_schemas = try(each.value.number_schemas, [])

    admin_create_user_config = try(each.value.admin_create_user_config, {})
    # {
    # allow_admin_create_user_only = false
    # email_subject = "Here, your verification code is {####}"
  # }

 # Account recovery settings
  recovery_mechanisms = try(each.value.recovery_mechanisms, [])
  # [
    #  {
      # name     = "verified_email"
      # priority = 1
    # }
  # ]


  email_configuration = try(each.value.email_configuration, {}) 
  # {
    # email_sending_account  = "DEVELOPER"
    # reply_to_email_address = try(each.value.reply_to_email_address, null)
    # source_arn             = try(each.value.source_arn, null)
  # }

    sms_configuration = try(each.value.sms_configuration, {}) 
    # {
    # external_id    = try(each.value.external_id, null)
    # sns_caller_arn = "arn:aws:iam::026090543330:role/cognito_pinpoint_sms_role_dev"  
  # }

   tags = merge(
   
     local.common_tags,
     local.cognito_additional_tags
 )
  
  
}

## right now, i have hardcoded in terraform, will read values from config
resource "aws_cognito_user_pool_client" "app_client" {
  for_each = var.cognito_pool_configs

  name         = try(each.value.cognito_app_client_name, null) 
  user_pool_id = try(each.value.user_pool_id, module.cognito-user-pool[each.key].id)

  generate_secret              = try(each.value.generate_secret, false)#false
  prevent_user_existence_errors = try(each.value.prevent_user_existence_errors, "ENABLED")#"ENABLED"

  explicit_auth_flows = try(each.value.explicit_auth_flows, null)
  # [
  #  "ALLOW_REFRESH_TOKEN_AUTH",
  #  "ALLOW_USER_PASSWORD_AUTH",
  #  "ALLOW_USER_SRP_AUTH"
  # ]




}
