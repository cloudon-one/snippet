host_project_id  = "kwi-prod-us-host-8a4a"
network_name = "kwi-vpc"
subnets = [
  {
    subnet_name               = "gke-subnet"
    subnet_ip                 = "10.170.16.0/20"
    subnet_region             = "us-central1"
    subnet_private_access     = true
    subnet_flow_logs          = true
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling = 0.7
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
  },
  {
    subnet_name = "proxy-subnet"
    subnet_ip : "10.170.5.0/26"
    subnet_region : "us-central1"
    subnet_private_access : false
    subnet_flow_logs : false
    purpose : "INTERNAL_HTTPS_LOAD_BALANCER"
    role : "ACTIVE"
  },
   {
    subnet_name               = "data-subnet"
    subnet_ip                 = "10.170.32.0/20"
    subnet_region             = "us-central1"
    subnet_private_access     = true
    subnet_flow_logs          = true
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling = 0.5
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
  }
]
gke_secondary_ranges = {
  gke-subnet = [
    {
      range_name    = "pods"
      ip_cidr_range = "10.170.192.0/18"
    },
    {
      range_name    = "services"
      ip_cidr_range = "10.170.48.0/20"
    }
  ]
}


