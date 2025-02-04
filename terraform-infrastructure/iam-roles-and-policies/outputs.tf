

output "iam_role_arn" {
  description = "ARN of IAM role"
  value = {
    for k, v in module.iam_role : k => v.iam_role_arn
  }
}

output "iam_role_name" {
  description = "Name of IAM role"
  value = {
    for k, v in module.iam_role : k => v.iam_role_name
  }
}

output "iam_role_path" {
  description = "Path of IAM role"
  value = {
    for k, v in module.iam_role : k => v.iam_role_path
  }
}

output "iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value = {
    for k, v in module.iam_role : k => v.iam_role_unique_id
  }
}


output "iam_instance_profile_arn" {
  description = "ARN of IAM instance profile"
  value = {
    for k, v in module.iam_role : k => v.iam_role_arn
  }
}

output "iam_instance_profile_name" {
  description = "Name of IAM instance profile"
  value = {
    for k, v in module.iam_role : k => v.iam_role_name
  }
}


output "iam_instance_profile_path" {
  description = "Path of IAM instance profile"
  value = {
    for k, v in module.iam_role : k => v.iam_role_path
  }
}
