# -----------
# General

project_id             = "kwi-prod-us-svc-gke-9998"
network_project_id     = "kwi-prod-us-host-8a4a"


#master_authorized_networks = [{
#  cidr_block   = "10.171.16.0/20"
#  display_name = "gke-vpc"
#  }
#]

# Node-pools
#node_pools = [{
#  "name"               = "service-pool",
#  "machine_type"       = "n2-standard-2",
#  "min_count"          = "1",
#  "max_count"          = "5",
#  "disk_size_gb"       = "100",
#  "disk_type"          = "pd-ssd"
#  "image_type"         = "COS_CONTAINERD",
#  "auto_repair"        = true
#  "auto_upgrade"       = true
#  "preemptible"        = false
#  "initial_node_count" = 1
#  },
  #{
  #  "name"               = "apps-pool",
  #  "machine_type"       = "n2-standard-2", # define type
  #  "min_count"          = "3",
  #  "max_count"          = "10",
  #  "disk_size_gb"       = "100",
  #  "disk_type"          = "pd-ssd"
  #  "image_type"         = "COS_CONTAINERD",
  #  "auto_repair"        = true
  #  "auto_upgrade"       = true
  #  "preemptible"        = false
  #  "initial_node_count" = 1
  #}
#]

#node_pools_oauth_scopes = {
#  service-pool = []
#  apps-pool    = []
#}

#node_pools_metadata = {
#  service-pool = {
#   node-pool-metadata-custom-value = "service-pool"
#  },
#  apps-pool = {
#    node-pool-metadata-custom-value = "apps-pool"
#  }
#}
#node_pools_tags = {
#  apps-pool    = ["apps-pool"],
#  service-pool = ["service-pool"],
#}