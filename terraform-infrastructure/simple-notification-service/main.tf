locals {
  additional_tags = {
    customer_critical = "false"
  }
}


# effibuild security group
# Doc here
# https://registry.terraform.io/modules/terraform-aws-modules/sns/aws/latest?tab=inputs
# https://github.com/terraform-aws-modules/terraform-aws-sns/blob/master/examples/complete/main.tf


module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"

  for_each = var.simple_notification_service_configs
  name = try("${var.region_short}-${var.environment_name}-${each.value.sns_name_suffix}", null)
  display_name = try(each.value.display_name, null)
  kms_master_key_id = try(each.value.kms_master_key_id, null)
  
 tags = merge(
     local.common_tags,
     local.additional_tags
   )
}

resource "aws_sns_topic_subscription" "sms_subscription" {
  for_each = var.simple_notification_service_configs
  topic_arn = module.sns_topic[each.key].topic_arn
  protocol  = "sms"
  endpoint  = try(each.value.endpoint, null)
}
