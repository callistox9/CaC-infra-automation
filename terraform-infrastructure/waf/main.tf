locals {
  waf_additional_tags = {
    customer_critical = "false"
    common_resource   = "true"
  }
}

# Link to Docs 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl

resource "aws_wafv2_web_acl" "waf" {
  for_each = var.waf_configs

  name        = join("-", ["${var.region_short}", "${var.environment_name}",try(each.value.name_suffix,null)])
  description = "Default WAF for all CloudFront"
  scope       = "CLOUDFRONT"

  default_action {
    allow {}
  }


  rule {
    name     = "AWSManagedRulesBotControl"
    priority = 1

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesBotControlRuleSet"
        vendor_name = "AWS"
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      # metric_name                =  "AWSManagedRulesBotControl"
      metric_name                =  join("-", ["${var.region_short}", "${var.environment_name}",try(each.value.name_suffix,null) , "awsmanagedrulesbotcontrol", "metric"])
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    # metric_name                = "webAcl"
    metric_name                = join("-", ["${var.region_short}", "${var.environment_name}",try(each.value.name_suffix,null) , "metric"])
    sampled_requests_enabled   = true
  }

  tags = merge(
    local.common_tags,
    local.waf_additional_tags
  )

}

# resource "aws_wafv2_web_acl_association" "example" {
#   resource_arn = aws_api_gateway_stage.example.arn
#   web_acl_arn  = aws_wafv2_web_acl.example.arn
# }





