variable "admin_project" {
  default = ""
}

variable "region" {
  default = "us-central1"
}

variable "host_project_name" {
  description = "Host Project Name suffix. Project ID will be {var.host_project_name}-{var.geo}-{var.environment}"
  type        = string
}

variable "billing_account" {
  description = "Billing Account"
  type        = string
}

variable "domain" {
  description = "Organization domain"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

# -----------------------
# API's
variable "active_apis" {
  description = "List of API to activate on the host project"
  type        = list(string)
  default = [
    "compute.googleapis.com",
    "logging.googleapis.com",
    "dns.googleapis.com",
    "oslogin.googleapis.com",
    "monitoring.googleapis.com",
    "networkmanagement.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
    "container.googleapis.com"
  ]
}

variable "folder_id" {
  description = "If specified, the host project will be created under this folder"
  type        = string
  default     = null
}

variable "lien" {
  description = "If set to false the lien is disabled"
  type        = bool
  default     = true
}

variable "default_service_account" {
  description = "Project default service account setting: can be one of `delete`, `deprivilege`, `disable`, or `keep`."
  default     = "deprivilege"
  type        = string
}

variable "service_accounts" {
  description = "List of service accounts to be created in the host project"
  type        = list(string)
  default     = []
}



variable "credentials_path" {
  description = "Path to a service account credentials file with rights to run the Project Factory. If this file is absent Terraform will fall back to Application Default Credentials."
  type        = string
  default     = ""
}

variable "project_id" {
  description = "The project ID to host the network in"
  type        = string
  default     = ""
}
