module "cloud_nat" {
  source                              = "terraform-google-modules/cloud-nat/google"
  version                             = "2.2.1"
  create_router                       = true
  enable_endpoint_independent_mapping = false
  icmp_idle_timeout_sec               = var.icmp_idle_timeout_sec
  log_config_enable                   = true
  log_config_filter                   = "ERRORS_ONLY"
  min_ports_per_vm                    = var.min_ports_per_vm
  name                                = "kwi-us-stg-nat"
  network                             = module.vpc.network_name
  project_id                          = var.host_project_id
  region                              = var.region
  router                              = "kwi-us-stg-router"
  router_asn                          = "64514"
  router_keepalive_interval           = var.router_keepalive_interval
  source_subnetwork_ip_ranges_to_nat  = var.source_subnetwork_ip_ranges_to_nat
  tcp_established_idle_timeout_sec    = var.tcp_established_idle_timeout_sec
  tcp_transitory_idle_timeout_sec     = var.tcp_transitory_idle_timeout_sec
  udp_idle_timeout_sec                = var.udp_idle_timeout_sec
}
