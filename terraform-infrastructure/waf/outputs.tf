output "web_acl_id" {
  description = "The ID of the WAFv2 Web ACL"
#   value       = aws_wafv2_web_acl.waf.id
  value = {
    for k, v in aws_wafv2_web_acl.waf : k => v.id
  }
}

output "web_acl_arn" {
  description = "The ARN of the WAFv2 Web ACL"
#   value       = aws_wafv2_web_acl.waf.arn
  value = {
    for k, v in aws_wafv2_web_acl.waf : k => v.arn
  }
}

output "web_acl_name" {
  description = "The name of the WAFv2 Web ACL"
#   value       = aws_wafv2_web_acl.waf.name
  value = {
    for k, v in aws_wafv2_web_acl.waf : k => v.name
  }
}

output "web_acl_capacity" {
  description = "The capacity (WCU) required by this WAFv2 Web ACL"
#   value       = aws_wafv2_web_acl.waf.capacity
  value = {
    for k, v in aws_wafv2_web_acl.waf : k => v.capacity
  }
}