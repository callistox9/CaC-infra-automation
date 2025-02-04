output "sns_subscriptions" {
  description = "List of SNS subscriptions for the topic"
  value = {
    for k, v in module.sns_topic : k => v.subscriptions
  }
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value = {
    for k, v in module.sns_topic : k => v.topic_arn
  }
}

output "sns_topic_beginning_archive_time" {
  description = "The beginning archive time of the SNS topic"
  value = {
    for k, v in module.sns_topic : k => v.topic_beginning_archive_time
  }
}

output "sns_topic_id" {
  description = "The ID of the SNS topic"
  value = {
    for k, v in module.sns_topic : k => v.topic_id
  }
}

output "sns_topic_name" {
  description = "The name of the SNS topic"
  value = {
    for k, v in module.sns_topic : k => v.topic_name
  }
}

output "sns_topic_owner" {
  description = "The ID of the AWS account that owns the SNS topic"
  value = {
    for k, v in module.sns_topic : k => v.topic_owner
  }
}
