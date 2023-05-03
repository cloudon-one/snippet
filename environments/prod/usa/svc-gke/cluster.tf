module "gke" {
  source                             = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster-update-variant"
  version                            = "24.0.0"
  project_id                         = var.project_id
  region                             = var.region
  network_project_id                 = var.network_project_id
  cluster_autoscaling                = var.cluster_autoscaling
  master_authorized_networks         = var.master_authorized_networks
  cluster_resource_labels            = var.cluster_resource_labels
  node_pools                         = var.node_pools
  node_pools_labels                  = var.node_pools_labels
  node_pools_metadata                = var.node_pools_metadata
  node_pools_taints                  = var.node_pools_taints
  node_pools_tags                    = var.node_pools_tags
  node_pools_oauth_scopes            = var.node_pools_oauth_scopes
  cluster_ipv4_cidr                  = var.cluster_ipv4_cidr
  node_metadata                      = "GKE_METADATA"
  description                        = "Managed by Terraform"
  name                               = "kwi-cluster"
  cluster_dns_provider               = "PLATFORM_DEFAULT"
  cluster_dns_scope                  = "VPC_SCOPE"
  datapath_provider                  = "ADVANCED_DATAPATH"
  network                            = "kwi-vpc"
  subnetwork                         = "gke-subnet"
  ip_range_pods                      = "pods"
  ip_range_services                  = "services"
  release_channel                    = "REGULAR"
  master_ipv4_cidr_block             = "10.170.64.0/28"
  identity_namespace                 = "enabled"
  initial_node_count                 = 1
  regional                           = true
  remove_default_node_pool           = false
  disable_legacy_metadata_endpoints  = true
  create_service_account             = true
  enable_private_endpoint            = false
  enable_private_nodes               = true
  horizontal_pod_autoscaling         = true
  enable_resource_consumption_export = true
  grant_registry_access              = true
  deploy_using_private_endpoint      = false
  http_load_balancing                = true
  enable_vertical_pod_autoscaling    = true
  enable_shielded_nodes              = true
  add_cluster_firewall_rules         = true
  disable_default_snat               = false
  dns_cache                          = true
  enable_identity_service            = true
  enable_intranode_visibility        = true
  enable_l4_ilb_subsetting           = true
  filestore_csi_driver               = true
  gce_pd_csi_driver                  = true
  gke_backup_agent_config            = true
  master_global_access_enabled       = true
  monitoring_enable_managed_prometheus = true
  depends_on = [
    module.gke-k8s-iam
  ]
}

resource "google_compute_network_peering_routes_config" "peering_gke_routes" {
  count   = var.modify_gke_peer ? 1 : 0
  project = var.network_project_id
  peering = module.gke.peering_name
  network = "kwi-vpc"

  import_custom_routes = true
  export_custom_routes = true
}

data "google_project" "gke_project" {
  project_id = var.project_id
}