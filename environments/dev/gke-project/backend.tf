terraform {
  backend "gcs" {
    bucket = "snippet-digital-admin-dev"
    prefix = "envs/dev/gke-project"
  }
}