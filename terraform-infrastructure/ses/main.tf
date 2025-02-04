
resource "aws_ses_domain_identity" "ses_domain_identity" {
  for_each = var.ses_configs
  domain = try(each.value.domain, null)
}
resource "aws_ses_domain_dkim" "dkim" {
  for_each = var.ses_configs
  domain = aws_ses_domain_identity.ses_domain_identity[each.key].id
}

resource "aws_ses_email_identity" "email_verification" {
  for_each = var.ses_configs
  email = try(each.value.email, null)
  
}

