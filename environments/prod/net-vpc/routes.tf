module "gke_routes" {
  source  = "terraform-google-modules/network/google//modules/routes"
  version = "~> 6.0.0"

  project_id   = var.host_project_id
  network_name = "vpc"

  routes = [
    {
      name              = "egress-to-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = ""
      next_hop_internet = "true"
    },
  ]
}
