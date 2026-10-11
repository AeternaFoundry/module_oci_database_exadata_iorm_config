output "database_exadata_iorm_configs_id" {
  description = "Map of id values across all database_exadata_iorm_configs, keyed the same as var.database_exadata_iorm_configs except keys with no id are omitted"
  value       = { for k, v in oci_database_exadata_iorm_config.database_exadata_iorm_configs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "database_exadata_iorm_configs_db_plans" {
  description = "Map of db_plans values across all database_exadata_iorm_configs, keyed the same as var.database_exadata_iorm_configs except keys with no db_plans are omitted"
  value       = { for k, v in oci_database_exadata_iorm_config.database_exadata_iorm_configs : k => v.db_plans if v.db_plans != null && length(v.db_plans) > 0 }
}
output "database_exadata_iorm_configs_db_system_id" {
  description = "Map of db_system_id values across all database_exadata_iorm_configs, keyed the same as var.database_exadata_iorm_configs except keys with no db_system_id are omitted"
  value       = { for k, v in oci_database_exadata_iorm_config.database_exadata_iorm_configs : k => v.db_system_id if v.db_system_id != null && length(v.db_system_id) > 0 }
}
output "database_exadata_iorm_configs_lifecycle_details" {
  description = "Map of lifecycle_details values across all database_exadata_iorm_configs, keyed the same as var.database_exadata_iorm_configs except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_database_exadata_iorm_config.database_exadata_iorm_configs : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "database_exadata_iorm_configs_objective" {
  description = "Map of objective values across all database_exadata_iorm_configs, keyed the same as var.database_exadata_iorm_configs except keys with no objective are omitted"
  value       = { for k, v in oci_database_exadata_iorm_config.database_exadata_iorm_configs : k => v.objective if v.objective != null && length(v.objective) > 0 }
}
output "database_exadata_iorm_configs_state" {
  description = "Map of state values across all database_exadata_iorm_configs, keyed the same as var.database_exadata_iorm_configs except keys with no state are omitted"
  value       = { for k, v in oci_database_exadata_iorm_config.database_exadata_iorm_configs : k => v.state if v.state != null && length(v.state) > 0 }
}

