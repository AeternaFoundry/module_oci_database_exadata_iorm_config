variable "database_exadata_iorm_configs" {
  description = <<EOT
Map of database_exadata_iorm_configs, attributes below
Required:
    - db_system_id
    - db_plans (block):
        - db_name (required)
        - share (required)
Optional:
    - objective
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    db_system_id = string
    objective    = optional(string)
    db_plans = list(object({
      db_name = string
      share   = number
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.database_exadata_iorm_configs : (
        length(v.db_plans) >= 1
      )
    ])
    error_message = "Each db_plans list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.database_exadata_iorm_configs : (
        alltrue([for item in v.db_plans : (item.share >= 1 && item.share <= 32)])
      )
    ])
    error_message = "must be between 1 and 32"
  }
  validation {
    condition = alltrue([
      for k, v in var.database_exadata_iorm_configs : (
        v.objective == null || (contains([for v in ["LOW_LATENCY", "HIGH_THROUGHPUT", "BALANCED", "AUTO"] : lower(v)], lower(v.objective)))
      )
    ])
    error_message = "must be one of: \"LOW_LATENCY\", \"HIGH_THROUGHPUT\", \"BALANCED\", \"AUTO\""
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

