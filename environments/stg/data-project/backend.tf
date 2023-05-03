terraform {
  backend "gcs" {
    bucket = "snippet-digital-admin-stg"
    prefix = "envs/stg/data-project"
  }
}