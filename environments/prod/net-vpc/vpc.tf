module "vpc" {
  source                                 = "terraform-google-modules/network/google"
  version                                = "~> 6.0.0"
  project_id                             = var.host_project_id
  network_name                           = var.network_name
  delete_default_internet_gateway_routes = true
  shared_vpc_host                        = true
  subnets                                = var.subnets
  secondary_ranges                       = var.gke_secondary_ranges
}


module "subnets_beta" {
  source       = "terraform-google-modules/network/google//modules/subnets-beta"
  version      = "~> 6.0.0"
  project_id   = var.host_project_id
  network_name = var.network_name
  subnets      = var.subnets_beta
}