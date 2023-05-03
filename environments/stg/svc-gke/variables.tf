variable "admin_project" {
  default = "snippet-digital-admin"
}

variable "region" {
  default = "us-central1"
}

variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in (required)"
}

variable "network_project_id" {
  type        = string
  description = "The project ID of the shared VPC's host (for shared vpc support)"
  default     = ""
}



variable "cluster_ipv4_cidr" {
  default     = null
  description = "The IP address range of the kubernetes pods in this cluster. Default is an automatically assigned CIDR."
}

variable "cluster_autoscaling" {
  type = object({
    enabled             = bool
    autoscaling_profile = string
    min_cpu_cores       = number
    max_cpu_cores       = number
    min_memory_gb       = number
    max_memory_gb       = number
    gpu_resources       = list(object({ resource_type = string, minimum = number, maximum = number }))
  })
  default = {
    enabled             = true
    autoscaling_profile = "BALANCED"
    max_cpu_cores       = 16
    min_cpu_cores       = 4
    max_memory_gb       = 32
    min_memory_gb       = 8
    gpu_resources       = []

  }
  description = "Cluster autoscaling configuration. See [more details](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters#clusterautoscaling)"
}

variable "cluster_resource_labels" {
  type        = map(string)
  description = "The GCE resource labels (a map of key/value pairs) to be applied to the cluster"
  default     = {
    "environment" = "stg",
    "location" = "us-central1"
  }
}
variable "master_authorized_networks" {
  type        = list(object({ cidr_block = string, display_name = string }))
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
  default     = []
}

variable "release_channel" {
  type        = string
  description = "The release channel of this cluster"
  default = "REGULAR"
}

variable "cluster_telemetry_type" {
  type        = string
  description = "Available options include ENABLED, DISABLED, and SYSTEM_ONLY"
  default = "DISABLED"
}