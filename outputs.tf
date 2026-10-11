output "sagemaker_pipelines_id" {
  description = "Map of id values across all sagemaker_pipelines, keyed the same as var.sagemaker_pipelines"
  value       = { for k, v in aws_sagemaker_pipeline.sagemaker_pipelines : k => v.id if v.id != null && length(v.id) > 0 }
}
output "sagemaker_pipelines_arn" {
  description = "Map of arn values across all sagemaker_pipelines, keyed the same as var.sagemaker_pipelines"
  value       = { for k, v in aws_sagemaker_pipeline.sagemaker_pipelines : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "sagemaker_pipelines_parallelism_configuration" {
  description = "Map of parallelism_configuration values across all sagemaker_pipelines, keyed the same as var.sagemaker_pipelines"
  value       = { for k, v in aws_sagemaker_pipeline.sagemaker_pipelines : k => one(v.parallelism_configuration) if v.parallelism_configuration != null && length(v.parallelism_configuration) > 0 }
}
output "sagemaker_pipelines_pipeline_definition" {
  description = "Map of pipeline_definition values across all sagemaker_pipelines, keyed the same as var.sagemaker_pipelines"
  value       = { for k, v in aws_sagemaker_pipeline.sagemaker_pipelines : k => v.pipeline_definition if v.pipeline_definition != null && length(v.pipeline_definition) > 0 }
}
output "sagemaker_pipelines_pipeline_definition_s3_location" {
  description = "Map of pipeline_definition_s3_location values across all sagemaker_pipelines, keyed the same as var.sagemaker_pipelines"
  value       = { for k, v in aws_sagemaker_pipeline.sagemaker_pipelines : k => one(v.pipeline_definition_s3_location) if v.pipeline_definition_s3_location != null && length(v.pipeline_definition_s3_location) > 0 }
}
output "sagemaker_pipelines_pipeline_description" {
  description = "Map of pipeline_description values across all sagemaker_pipelines, keyed the same as var.sagemaker_pipelines"
  value       = { for k, v in aws_sagemaker_pipeline.sagemaker_pipelines : k => v.pipeline_description if v.pipeline_description != null && length(v.pipeline_description) > 0 }
}
output "sagemaker_pipelines_pipeline_display_name" {
  description = "Map of pipeline_display_name values across all sagemaker_pipelines, keyed the same as var.sagemaker_pipelines"
  value       = { for k, v in aws_sagemaker_pipeline.sagemaker_pipelines : k => v.pipeline_display_name if v.pipeline_display_name != null && length(v.pipeline_display_name) > 0 }
}
output "sagemaker_pipelines_pipeline_name" {
  description = "Map of pipeline_name values across all sagemaker_pipelines, keyed the same as var.sagemaker_pipelines"
  value       = { for k, v in aws_sagemaker_pipeline.sagemaker_pipelines : k => v.pipeline_name if v.pipeline_name != null && length(v.pipeline_name) > 0 }
}
output "sagemaker_pipelines_region" {
  description = "Map of region values across all sagemaker_pipelines, keyed the same as var.sagemaker_pipelines"
  value       = { for k, v in aws_sagemaker_pipeline.sagemaker_pipelines : k => v.region if v.region != null && length(v.region) > 0 }
}
output "sagemaker_pipelines_role_arn" {
  description = "Map of role_arn values across all sagemaker_pipelines, keyed the same as var.sagemaker_pipelines"
  value       = { for k, v in aws_sagemaker_pipeline.sagemaker_pipelines : k => v.role_arn if v.role_arn != null && length(v.role_arn) > 0 }
}
output "sagemaker_pipelines_tags" {
  description = "Map of tags values across all sagemaker_pipelines, keyed the same as var.sagemaker_pipelines"
  value       = { for k, v in aws_sagemaker_pipeline.sagemaker_pipelines : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "sagemaker_pipelines_tags_all" {
  description = "Map of tags_all values across all sagemaker_pipelines, keyed the same as var.sagemaker_pipelines"
  value       = { for k, v in aws_sagemaker_pipeline.sagemaker_pipelines : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

