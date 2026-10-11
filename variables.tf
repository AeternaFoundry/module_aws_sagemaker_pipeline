variable "sagemaker_pipelines" {
  description = <<EOT
Map of sagemaker_pipelines, attributes below
Required:
    - pipeline_display_name
    - pipeline_name
Optional:
    - pipeline_definition
    - pipeline_description
    - region
    - role_arn
    - tags
    - tags_all
    - parallelism_configuration (block):
        - max_parallel_execution_steps (required)
    - pipeline_definition_s3_location (block):
        - bucket (required)
        - object_key (required)
        - version_id (optional)
EOT

  type = map(object({
    pipeline_display_name = string
    pipeline_name         = string
    pipeline_definition   = optional(string)
    pipeline_description  = optional(string)
    region                = optional(string)
    role_arn              = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    parallelism_configuration = optional(object({
      max_parallel_execution_steps = number
    }))
    pipeline_definition_s3_location = optional(object({
      bucket     = string
      object_key = string
      version_id = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_pipelines : (
        v.parallelism_configuration == null || (v.parallelism_configuration.max_parallel_execution_steps >= 1)
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_pipelines : (
        v.pipeline_definition == null || ((length(v.pipeline_definition) >= 1 && length(v.pipeline_definition) <= 1048576) && (can(jsondecode(v.pipeline_definition))))
      )
    ])
    error_message = "all of: must be between 1 and 1048576 characters; must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_pipelines : (
        v.pipeline_description == null || (length(v.pipeline_description) >= 1 && length(v.pipeline_description) <= 3072)
      )
    ])
    error_message = "must be between 1 and 3072 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_pipelines : (
        (length(v.pipeline_display_name) >= 1 && length(v.pipeline_display_name) <= 256) && (can(regex("^[0-9A-Za-z]([0-9A-Za-z-])*$", v.pipeline_display_name)))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; Valid characters are a-z, A-Z, 0-9, and - (hyphen)."
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_pipelines : (
        (length(v.pipeline_name) >= 1 && length(v.pipeline_name) <= 256) && (can(regex("^[0-9A-Za-z]([0-9A-Za-z-])*$", v.pipeline_name)))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; Valid characters are a-z, A-Z, 0-9, and - (hyphen)."
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

