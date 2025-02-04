output "cognito_user_pool_arn" {
  description = "The ARN of the Cognito User Pool"
  value = {
    for k, v in module.cognito-user-pool : k => v.arn
  }
}

output "cognito_client_ids" {
  description = "A list of client IDs for the Cognito User Pool"
  value = {
    for k, v in module.cognito-user-pool : k => v.client_ids
  }
}

output "cognito_client_ids_map" {
  description = "A map of client IDs for the Cognito User Pool"
  value = {
    for k, v in module.cognito-user-pool : k => v.client_ids_map
  }
}

output "cognito_client_secrets" {
  description = "A list of client secrets for the Cognito User Pool"
  value = {
    for k, v in module.cognito-user-pool : k => v.client_secrets
  }
}

output "cognito_client_secrets_map" {
  description = "A map of client secrets for the Cognito User Pool"
  value = {
    for k, v in module.cognito-user-pool : k => v.client_secrets_map
  }
}

output "cognito_creation_date" {
  description = "The creation date of the Cognito User Pool"
  value = {
    for k, v in module.cognito-user-pool : k => v.creation_date
  }
}

output "cognito_domain_app_version" {
  description = "The app version for the domain"
  value = {
    for k, v in module.cognito-user-pool : k => v.domain_app_version
  }
}

output "cognito_domain_aws_account_id" {
  description = "The AWS account ID for the domain"
  value = {
    for k, v in module.cognito-user-pool : k => v.domain_aws_account_id
  }
}

output "cognito_domain_cloudfront_distribution" {
  description = "The CloudFront distribution for the domain"
  value = {
    for k, v in module.cognito-user-pool : k => v.domain_cloudfront_distribution
  }
}

output "cognito_domain_cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution for the domain"
  value = {
    for k, v in module.cognito-user-pool : k => v.domain_cloudfront_distribution_arn
  }
}

output "cognito_domain_cloudfront_distribution_zone_id" {
  description = "The CloudFront distribution zone ID for the domain"
  value = {
    for k, v in module.cognito-user-pool : k => v.domain_cloudfront_distribution_zone_id
  }
}

output "cognito_domain_s3_bucket" {
  description = "The S3 bucket for the domain"
  value = {
    for k, v in module.cognito-user-pool : k => v.domain_s3_bucket
  }
}

output "cognito_endpoint" {
  description = "The endpoint of the Cognito User Pool"
  value = {
    for k, v in module.cognito-user-pool : k => v.endpoint
  }
}

output "cognito_user_pool_id" {
  description = "The ID of the Cognito User Pool"
  value = {
    for k, v in module.cognito-user-pool : k => v.id
  }
}

output "cognito_last_modified_date" {
  description = "The last modified date of the Cognito User Pool"
  value = {
    for k, v in module.cognito-user-pool : k => v.last_modified_date
  }
}

output "cognito_user_pool_name" {
  description = "The name of the Cognito User Pool"
  value = {
    for k, v in module.cognito-user-pool : k => v.name
  }
}

output "cognito_resource_servers_scope_identifiers" {
  description = "The scope identifiers for the resource servers"
  value = {
    for k, v in module.cognito-user-pool : k => v.resource_servers_scope_identifiers
  }
}
