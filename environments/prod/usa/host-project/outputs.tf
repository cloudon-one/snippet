// Project factory outputs
output "project_name" {
  value = module.host_project.project_name
}

output "project_number" {
  value = module.host_project.project_number
}

output "host_project_id" {
  value = module.host_project.project_id
}


output "domain" {
  value       = module.host_project.domain
  description = "The organization's domain"
}

output "group_email" {
  value       = module.host_project.group_email
  description = "The email of the G Suite group with group_name"
}

output "service_account_id" {
  value       = module.host_project.service_account_id
  description = "The id of the default service account"
}

output "service_account_display_name" {
  value       = module.host_project.service_account_display_name
  description = "The display name of the default service account"
}

output "service_account_email" {
  value       = module.host_project.service_account_email
  description = "The email of the default service account"
}

output "service_account_name" {
  value       = module.host_project.service_account_name
  description = "The fully-qualified name of the default service account"
}

output "service_account_unique_id" {
  value       = module.host_project.service_account_unique_id
  description = "The unique id of the default service account"
}

output "project_bucket_self_link" {
  value       = module.host_project.project_bucket_self_link
  description = "Project's bucket selfLink"
}

output "project_bucket_url" {
  value       = module.host_project.project_bucket_url
  description = "Project's bucket url"
}

output "budget_name" {
  value       = module.host_project.budget_name
  description = "The name of the budget if created"
}
