resource "oci_database_exadata_iorm_config" "database_exadata_iorm_configs" {
  for_each = var.database_exadata_iorm_configs

  db_system_id = each.value.db_system_id
  objective    = each.value.objective

  dynamic "db_plans" {
    for_each = each.value.db_plans
    content {
      db_name = db_plans.value.db_name
      share   = db_plans.value.share
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

