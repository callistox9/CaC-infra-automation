output "documentdb_master_username" {
  description = "DocumentDB Username for the master DB user"
  value       = {
    for k, v in module.documentdb_cluster : k => v.master_username
  }
}

output "documentdb_cluster_name" {
  description = "DocumentDB Cluster Identifier"
  value       = {
    for k, v in module.documentdb_cluster : k => v.cluster_name
  }
}

output "documentdb_arn" {
  description = "Amazon Resource Name (ARN) of the DocumentDB cluster"
  value       = {
    for k, v in module.documentdb_cluster : k => v.arn
  }
}

output "documentdb_endpoint" {
  description = "Endpoint of the DocumentDB cluster"
  value       = {
    for k, v in module.documentdb_cluster : k => v.endpoint
  }
}

output "documentdb_reader_endpoint" {
  description = "Read-only endpoint of the DocumentDB cluster, automatically load-balanced across replicas"
  value       = {
    for k, v in module.documentdb_cluster : k => v.reader_endpoint
  }
}

output "documentdb_master_host" {
  description = "DocumentDB master hostname"
  value       = {
    for k, v in module.documentdb_cluster : k => v.master_host
  }
}

output "documentdb_replicas_host" {
  description = "DocumentDB replicas hostname"
  value       = {
    for k, v in module.documentdb_cluster : k => v.replicas_host
  }
}


# output "documentdb_master_username" {
#   value       = module.documentdb_cluster.master_username
#   description = "DocumentDB Username for the master DB user"
# }

# output "documentdb_cluster_name" {
#   value       = module.documentdb_cluster.cluster_name
#   description = "DocumentDB Cluster Identifier"
# }

# output "documentdb_arn" {
#   value       = module.documentdb_cluster.arn
#   description = "Amazon Resource Name (ARN) of the DocumentDB cluster"
# }

# output "documentdb_endpoint" {
#   value       = module.documentdb_cluster.endpoint
#   description = "Endpoint of the DocumentDB cluster"
# }

# output "documentdb_reader_endpoint" {
#   value       = module.documentdb_cluster.reader_endpoint
#   description = "Read-only endpoint of the DocumentDB cluster, automatically load-balanced across replicas"
# }

# output "documentdb_master_host" {
#   value       = module.documentdb_cluster.master_host
#   description = "DocumentDB master hostname"
# }

# output "documentdb_replicas_host" {
#   value       = module.documentdb_cluster.replicas_host
#   description = "DocumentDB replicas hostname"
# }

# #TODO add documentdb security group details