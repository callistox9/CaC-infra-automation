output "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_distribution_arn
  }
}

output "cloudfront_distribution_caller_reference" {
  description = "The caller reference of the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_distribution_caller_reference
  }
}

output "cloudfront_distribution_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_distribution_domain_name
  }
}

output "cloudfront_distribution_etag" {
  description = "The ETag of the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_distribution_etag
  }
}

output "cloudfront_distribution_hosted_zone_id" {
  description = "The hosted zone ID of the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_distribution_hosted_zone_id
  }
}

output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_distribution_id
  }
}

output "cloudfront_distribution_in_progress_validation_batches" {
  description = "The number of in-progress validation batches for the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_distribution_in_progress_validation_batches
  }
}

output "cloudfront_distribution_last_modified_time" {
  description = "The last modified time of the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_distribution_last_modified_time
  }
}

output "cloudfront_distribution_status" {
  description = "The status of the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_distribution_status
  }
}

output "cloudfront_distribution_tags" {
  description = "The tags of the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_distribution_tags
  }
}

output "cloudfront_distribution_trusted_signers" {
  description = "The trusted signers of the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_distribution_trusted_signers
  }
}

output "cloudfront_monitoring_subscription_id" {
  description = "The monitoring subscription ID for the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_monitoring_subscription_id
  }
}

output "cloudfront_origin_access_controls" {
  description = "The origin access controls for the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_origin_access_controls
  }
}

output "cloudfront_origin_access_controls_ids" {
  description = "The IDs of the origin access controls for the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_origin_access_controls_ids
  }
}

output "cloudfront_origin_access_identities" {
  description = "The origin access identities for the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_origin_access_identities
  }
}

output "cloudfront_origin_access_identity_iam_arns" {
  description = "The IAM ARNs of the origin access identities for the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_origin_access_identity_iam_arns
  }
}

output "cloudfront_origin_access_identity_ids" {
  description = "The IDs of the origin access identities for the CloudFront distribution"
  value = {
    for k, v in module.cdn : k => v.cloudfront_origin_access_identity_ids
  }
}
