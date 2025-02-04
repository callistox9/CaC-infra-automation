output "arn" {
  description = "sagemaker domain arn"
  value = {
    for k, v in aws_sagemaker_domain.sagemaker_domain : k => v.arn
  }
}

output "id" {
  description = "sagemaker domain id"
  value = {
    for k, v in aws_sagemaker_domain.sagemaker_domain : k => v.id
  }
}