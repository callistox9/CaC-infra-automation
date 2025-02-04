output "redis_serverless_cache_arn" {
  description = "The Amazon Resource Name (ARN) of the serverless cache"
  value = {
    for k, v in module.elasticache_serverless_cache : k => v.serverless_cache_arn
  }
}

output "redis_serverless_cache_create_time" {
  description = "Timestamp of when the serverless cache was created"
  value = {
    for k, v in module.elasticache_serverless_cache : k => v.serverless_cache_create_time
  }
}

output "redis_serverless_cache_endpoint" {
  description = "Represents the information required for client programs to connect to a cache node"
  value = {
    for k, v in module.elasticache_serverless_cache : k => v.serverless_cache_endpoint
  }
}

output "redis_serverless_cache_full_engine_version" {
  description = "The name and version number of the engine the serverless cache is compatible with"
  value = {
    for k, v in module.elasticache_serverless_cache : k => v.serverless_cache_full_engine_version
  }
}

output "redis_serverless_cache_major_engine_version" {
  description = "The version number of the engine the serverless cache is compatible with"
  value = {
    for k, v in module.elasticache_serverless_cache : k => v.serverless_cache_major_engine_version
  }
}

output "redis_serverless_cache_reader_endpoint" {
  description = "Represents the information required for client programs to connect to a cache node"
  value = {
    for k, v in module.elasticache_serverless_cache : k => v.serverless_cache_reader_endpoint
  }
}

output "redis_serverless_cache_status" {
  description = "The current status of the serverless cache. The allowed values are CREATING, AVAILABLE, DELETING, CREATE-FAILED, and MODIFYING"
  value = {
    for k, v in module.elasticache_serverless_cache : k => v.serverless_cache_status
  }
}





# output "redis_serverless_cache_arn" {
#   description = "The amazon resource name of the serverless cache"
#   value       = module.elasticache_serverless_cache.serverless_cache_arn
# }

# output "redis_serverless_cache_create_time" {
#   description = "Timestamp of when the serverless cache was created"
#   value       = module.elasticache_serverless_cache.serverless_cache_create_time
# }

# output "redis_serverless_cache_endpoint" {
#   description = " Represents the information required for client programs to connect to a cache node"
#   value       = module.elasticache_serverless_cache.serverless_cache_endpoint
# }

# output "redis_serverless_cache_full_engine_version" {
#   description = "The name and version number of the engine the serverless cache is compatible with"
#   value       = module.elasticache_serverless_cache.serverless_cache_full_engine_version
# }

# output "redis_serverless_cache_major_engine_version" {
#   description = "The version number of the engine the serverless cache is compatible with"
#   value       = module.elasticache_serverless_cache.serverless_cache_major_engine_version
# }

# output "redis_serverless_cache_reader_endpoint" {
#   description = "Represents the information required for client programs to connect to a cache node"
#   value       = module.elasticache_serverless_cache.serverless_cache_reader_endpoint
# }

# output "redis_serverless_cache_status" {
#   description = "The current status of the serverless cache. The allowed values are CREATING, AVAILABLE, DELETING, CREATE-FAILED and MODIFYING"
#   value       = module.elasticache_serverless_cache.serverless_cache_status
# }
