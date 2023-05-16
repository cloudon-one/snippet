data "google_organization" "org" {
  domain = var.domain
}

module "host_project" {
  source                     = "terraform-google-modules/project-factory/google"
  version                    = "~> 14.1.0"
  name                       = var.host_project_name
  random_project_id          = true
  org_id                     = data.google_organization.org.org_id
  folder_id                  = var.folder_id
  billing_account            = var.billing_account
  default_service_account    = var.default_service_account
  lien                       = true
  disable_dependent_services = true
  activate_apis              = var.active_apis
}

resource "google_service_account" "service_accounts" {
  for_each   = toset(distinct(var.service_accounts))
  project    = module.host_project.project_id
  account_id = each.key
}
