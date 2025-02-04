
locals {
  name = "${var.region_short}-${var.sdlc}-${var.environment_name}"

  sqs_additional_tags = {
    
    customer_critical = "true"
  }

}

# Dead-letter queue configuration
# module "sqs_dead_letter_queue" {
#   source  = "terraform-aws-modules/sqs/aws"
#   for_each = var.sqs_configs

#   name  = try(each.value.dlq_name, "sqs_dead_letter_queue")#"my-dead-letter-queue"
#   fifo_queue  = false
 
#  tags = merge(
#     local.common_tags,
#     local.sqs_additional_tags
#   )
# }

module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  for_each = var.sqs_configs

  name                 = try(each.value.name, "sqs_default")
  fifo_queue                 = try(each.value.fifo_queue, false)#false
  delay_seconds              = try(each.value.delay_seconds, 0) #0                             # Delivery delay set to 0 seconds
  max_message_size           = try(each.value.max_message_size, 262144)#262144                        # Maximum message size set to 256 KB in bytes
  message_retention_seconds  = try(each.value.message_retention_seconds, 345600)#345600                        # Message retention period set to 4 days (in seconds)
  receive_wait_time_seconds  = try(each.value.receive_wait_time_seconds, 0)#0                             # Receive message wait time set to 0 seconds
  visibility_timeout_seconds = try(each.value.visibility_timeout_seconds, 30)#30                            # Visibility timeout set to 30 seconds

  #   redrive_policy = each.value.enable_redrive_policy ? jsonencode({
  #   deadLetterTargetArn = module.sqs_dead_letter_queue.queue_arn
  #   maxReceiveCount     = tostring(try(each.value.redrive_policy.maxReceiveCount, 10))
  # }) : null
  # # redrive_policy = jsonencode({
  # #   deadLetterTargetArn = try(each.value.deadLetterTargetArn,"")#module.dead_letter_queue.queue_arn # Reference to the DLQ
  # #   maxReceiveCount     = tostring(try(each.value.maxReceiveCount, 10))                                 # Maximum receives before messages are moved to the DLQ
  # # })


  tags = merge(
    local.common_tags,
    local.sqs_additional_tags
  )
}
# resource "aws_sqs_queue_policy" "sqs_policy" {
#   for_each = var.sqs_configs
#   queue_url = module.sqs[each.key].sqs_queue_url

#   policy = each.value.access_policy
# }

