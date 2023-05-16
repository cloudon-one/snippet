data "google_organization" "org" {
  domain = var.domain
}
module "gke_project" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 14.1.0"
  name                        = var.gke_project_name
  random_project_id           = true
  org_id                      = data.google_organization.org.org_id
  folder_id                   = var.folder_id
  billing_account             = var.billing_account
  lien                        = false
  disable_dependent_services  = true
  disable_services_on_destroy = true
  svpc_host_project_id        = var.host_project_id
  shared_vpc_subnets          = var.gke_subnets_self_links
}

module "gke_apis" {
  source        = "terraform-google-modules/project-factory/google//modules/project_services"
  version       = "~> 14.1.0"
  activate_apis = var.gke_apis
  project_id    = module.gke_project.project_id
  depends_on    = [module.gke_project]
}