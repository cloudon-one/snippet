module "gke" {
  source                             = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-public-cluster"
  version                            = "24.0.0"
  project_id                         = var.project_id
  region                             = var.region
  network_project_id                 = var.network_project_id
  master_authorized_networks         = var.master_authorized_networks
  cluster_resource_labels            = var.cluster_resource_labels
  cluster_ipv4_cidr                  = var.cluster_ipv4_cidr
  description                        = "Managed by Terraform"
  name                               = "kwi-cluster"
  datapath_provider                  = "ADVANCED_DATAPATH"
  network                            = "kwi-vpc"
  subnetwork                         = "gke-subnet"
  ip_range_pods                      = "pods"
  ip_range_services                  = "services"
  regional                           = true
  create_service_account             = true
  grant_registry_access              = true
  horizontal_pod_autoscaling         = true
  enable_vertical_pod_autoscaling    = true
  add_cluster_firewall_rules         = true
  add_master_webhook_firewall_rules  = true
  enable_cost_allocation             = true
  depends_on = [
    module.gke-k8s-iam
  ]
}
data "google_project" "gke_project" {
  project_id = var.project_id
}