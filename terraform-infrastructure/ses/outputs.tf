
# Output for SES Domain Identity ARN
output "ses_domain_identity_arn" {
  description = "ARN of the SES domain identity."
  value = { for key, identity in aws_ses_domain_identity.ses_domain_identity : key => identity.arn }
}

# Output for SES Domain Verification Token
output "ses_domain_verification_token" {
  description = "Verification token for the SES domain identity."
  value = { for key, identity in aws_ses_domain_identity.ses_domain_identity : key => identity.verification_token }
}

# Output for SES DKIM Tokens
output "ses_dkim_tokens" {
  description = "DKIM tokens for the SES domain identity."
  value = { for key, dkim in aws_ses_domain_dkim.dkim : key => dkim.dkim_tokens }
}

# Output for SES Email Identity ARN
output "ses_email_identity_arn" {
  description = "ARN of the SES email identity."
  value = { for key, email_identity in aws_ses_email_identity.email_verification : key => email_identity.arn }
}

# Output for SES Email Identity Verification Status
# output "ses_email_identity_verification_status" {
#   description = "Verification status of the SES email identity."
#   value = { for key, email_identity in aws_ses_email_identity.email_verification : key => email_identity.verification_status }
# }
# output "access_key_id" {
#   description = "The IAM access key ID"
#   value = {
#     for k, v in module.ses : k => v.access_key_id
#   }
# }

# output "custom_from_domain" {
#   description = "The custom domain for the 'From' email address"
#   value = {
#     for k, v in module.ses : k => v.custom_from_domain
#   }
# }

# # output "secret_access_key" {
# #   description = "The secret access key for the IAM user"
# #   value = {
# #     for k, v in module.ses : k => v.secret_access_key
# #   }
# # }

# output "ses_dkim_tokens" {
#   description = "DKIM tokens for SES"
#   value = {
#     for k, v in module.ses : k => v.ses_dkim_tokens
#   }
# }

# output "ses_domain_identity_arn" {
#   description = "The ARN of the SES domain identity"
#   value = {
#     for k, v in module.ses : k => v.ses_domain_identity_arn
#   }
# }

# output "ses_group_name" {
#   description = "The name of the SES IAM group"
#   value = {
#     for k, v in module.ses : k => v.ses_group_name
#   }
# }

# # output "ses_smtp_password" {
# #   description = "The SMTP password for SES"
# #   value = {
# #     for k, v in module.ses : k => v.ses_smtp_password
# #   }
# # }

# output "spf_record" {
#   description = "The SPF record for SES"
#   value = {
#     for k, v in module.ses : k => v.spf_record
#   }
# }

# output "user_arn" {
#   description = "The ARN of the IAM user"
#   value = {
#     for k, v in module.ses : k => v.user_arn
#   }
# }

# output "user_name" {
#   description = "The name of the IAM user"
#   value = {
#     for k, v in module.ses : k => v.user_name
#   }
# }

# output "user_unique_id" {
#   description = "The unique ID of the IAM user"
#   value = {
#     for k, v in module.ses : k => v.user_unique_id
#   }
# }
