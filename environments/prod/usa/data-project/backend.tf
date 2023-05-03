terraform {
  backend "gcs" {
    bucket = "snippet-digital-admin-prod"
    prefix = "envs/prod/data-project"
  }
}