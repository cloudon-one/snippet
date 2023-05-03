variable "admin_project_name" {
  description = "Admin Project Name"
  type        = string
  default     = "administration"
}

variable "admin_project_id" {
  description = "The ID to give the project. If not provided, the `name` will be used."
  type        = string
  default     = ""
}

variable "admin_random_project_id" {
  description = "Flag to enable random suffix generation"
  type        = bool
  default     = false
}

variable "admin_folder_name" {
  description = "Name of the folder that will be created if admin_folder = true"
  type        = string
  default     = "admin"
}

variable "admin_state_bucket" {
  description = "Admin GCS bucket name for this module state file"
  type        = string
  default     = ""
}

variable "admin_state_bucket_location" {
  description = "Location of the admin_state_bucket"
  type        = string
  default     = "US"
}

variable "billing_account" {
  description = "Billing Account"
  type        = string
  default     = ""
}

variable "domain" {
  description = "Organization domain"
  type        = string
  default     = ""
}

variable "admin_folder" {
  description = "Wheater to create admin folder or not"
  type        = bool
  default     = true
}

variable "skip_gcloud_download" {
  description = "If set to false the gcloud binaries will be downloaded. Use for Terraform Cloud"
  type        = bool
  default     = true
}

variable "create_admin_bukets" {
  description = "Wheater to create admin_state_bucket. Turn this off when using with Terraform Cloud."
  type        = bool
  default     = true
}

variable "environment_state_buckets" {
  description = "Mapping of the state bucket suffix and location."
  type        = map(string)
  default = {
    dev   = "us"
    prod    = "us",
    stg = "us"
  }
}

variable "terraform_service_accounts" {
  description = "List of terraform service accounts to be created. Create a terraform service account for each environment folder"
  type        = list(string)
  default = [
    "tf-dev",
    "tf-stg",
    "tf-prod",
    "tf-admin"
  ]
}

variable "active_apis" {
  description = "List of API to activate on the project"
  type        = list(string)
  default = [
    "logging.googleapis.com",
    "compute.googleapis.com",
  ]
}

variable "org_parent_folder" {
  description = "Parent folder on organization level for all nested child folders"
  type        = string
  default     = ""
}

variable "region" {
  default = "us-central1"
}

variable "folders" {
  description = "Define a folder structure for your organization. You can define the struture up to 5 levels deep. Levels 2-5 map a child folder to a parent folder. Example {level1=[us, eu], level2 = [{name = tenant, parent = us}], level3 = [{name = dev, parent = us/tenant}]"
  type = object({
    level1 = list(string)
    #level2 = list(object({
    #  name   = string
    #  parent = string
    #}))
  })
  default = { level1 = ["prod", "stg", "dev"] }
}
