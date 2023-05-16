provider "google" {
  credentials = file("creds/serviceaccount.json")
  project     = var.admin_project
  region      = var.region
}