variable "admin_project" {
  default = ""
}

variable "region" {
  default = "us-central1"
}

variable "billing_account" {}
variable "domain" {}
variable "environment" {}
variable "host_project_id" {}
variable "gke_subnets_self_links" {}
variable "gke_project_name" {}
variable "folder_id" {}


variable "gke_apis" {
  description = "List of API to activate on the host project"
  type        = list(string)
  default = [
    "compute.googleapis.com",
    "logging.googleapis.com",
    "dns.googleapis.com",
    "oslogin.googleapis.com",
    "monitoring.googleapis.com",
    "cloudkms.googleapis.com",
    "networkmanagement.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
    "sqladmin.googleapis.com",
    "composer.googleapis.com"
  ]
}
