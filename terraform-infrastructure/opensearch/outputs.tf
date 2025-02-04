################################################################################
# Domain
################################################################################

output "opensearch_domain_arn" {
  description = "The Amazon Resource Name (ARN) of the OpenSearch domain"
  value = {
    for k, v in module.opensearch : k => v.domain_arn
  }
}

output "opensearch_domain_id" {
  description = "The unique identifier for the OpenSearch domain"
  value = {
    for k, v in module.opensearch : k => v.domain_id
  }
}

output "opensearch_domain_endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests"
  value = {
    for k, v in module.opensearch : k => v.domain_endpoint
  }
}

output "opensearch_domain_dashboard_endpoint" {
  description = "Domain-specific endpoint for the OpenSearch Dashboard without https scheme"
  value = {
    for k, v in module.opensearch : k => v.domain_dashboard_endpoint
  }
}

################################################################################
# Package Association(s)
################################################################################

output "opensearch_package_associations" {
  description = "Map of package associations created and their attributes in OpenSearch"
  value = {
    for k, v in module.opensearch : k => v.package_associations
  }
}

################################################################################
# VPC Endpoint(s)
################################################################################

output "opensearch_vpc_endpoints" {
  description = "Map of VPC endpoints created and their attributes for OpenSearch"
  value = {
    for k, v in module.opensearch : k => v.vpc_endpoints
  }
}

################################################################################
# Outbound Connections
################################################################################

output "opensearch_outbound_connections" {
  description = "Map of outbound connections created and their attributes for OpenSearch"
  value = {
    for k, v in module.opensearch : k => v.outbound_connections
  }
}

################################################################################
# CloudWatch Log Groups
################################################################################

output "opensearch_cloudwatch_logs" {
  description = "Map of CloudWatch log groups created and their attributes for OpenSearch"
  value = {
    for k, v in module.opensearch : k => v.cloudwatch_logs
  }
}

################################################################################
# Security Group
################################################################################

output "opensearch_security_group_arn" {
  description = "Amazon Resource Name (ARN) of the security group associated with OpenSearch"
  value = {
    for k, v in module.opensearch : k => v.security_group_arn
  }
}

output "opensearch_security_group_id" {
  description = "ID of the security group associated with OpenSearch"
  value = {
    for k, v in module.opensearch : k => v.security_group_id
  }
}











# ################################################################################
# # Domain
# ################################################################################

# output "opensearch_domain_arn" {
#   description = "The Amazon Resource Name (ARN) of the domain"
#   value       = module.opensearch.domain_arn
# }

# output "opensearch_domain_id" {
#   description = "The unique identifier for the domain"
#   value       = module.opensearch.domain_id
# }

# output "opensearch_domain_endpoint" {
#   description = "Domain-specific endpoint used to submit index, search, and data upload requests"
#   value       = module.opensearch.domain_endpoint
# }

# output "opensearch_domain_dashboard_endpoint" {
#   description = "Domain-specific endpoint for Dashboard without https scheme"
#   value       = module.opensearch.domain_dashboard_endpoint
# }

# ################################################################################
# # Package Association(s)
# ################################################################################

# output "opensearch_package_associations" {
#   description = "Map of package associations created and their attributes"
#   value       = module.opensearch.package_associations
# }

# ################################################################################
# # VPC Endpoint(s)
# ################################################################################

# output "opensearch_vpc_endpoints" {
#   description = "Map of VPC endpoints created and their attributes"
#   value       = module.opensearch.vpc_endpoints
# }

# ################################################################################
# # Outbound Connections
# ################################################################################

# output "opensearch_outbound_connections" {
#   description = "Map of outbound connections created and their attributes"
#   value       = module.opensearch.outbound_connections
# }

# ################################################################################
# # CloudWatch Log Groups
# ################################################################################

# output "opensearch_cloudwatch_logs" {
#   description = "Map of CloudWatch log groups created and their attributes"
#   value       = module.opensearch.cloudwatch_logs
# }

# ################################################################################
# # Security Group
# ################################################################################

# output "opensearch_security_group_arn" {
#   description = "Amazon Resource Name (ARN) of the security group"
#   value       = module.opensearch.security_group_arn
# }

# output "opensearch_security_group_id" {
#   description = "ID of the security group"
#   value       = module.opensearch.security_group_id
# }
