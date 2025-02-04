output "pinpoint_application_id" {
  description = "The unique identifier for the Pinpoint application."
  value = {
    for k, v in module.pinpoint : k => v.application_id
  }
}

output "pinpoint_arn" {
  description = "The Amazon Resource Name (ARN) of the Pinpoint application."
  value = {
    for k, v in module.pinpoint : k => v.arn
  }
}

output "pinpoint_role_arn" {
  description = "The ARN of the IAM role associated with the Pinpoint application."
  value = {
    for k, v in module.pinpoint : k => v.role_arn
  }
}

output "pinpoint_role_name" {
  description = "The name of the IAM role associated with the Pinpoint application."
  value = {
    for k, v in module.pinpoint : k => v.role_name
  }
}
