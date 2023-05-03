terraform {
  backend "gcs" {
    bucket = "snippet-admin-tf-state"
    prefix = "envs/admin"
  }
}