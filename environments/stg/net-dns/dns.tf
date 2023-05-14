module "cloud-dns" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "4.1.0"
  domain = "cloune.one."
  name = "cloudon-one"
  type = "public"

  project_id = var.project_id
  recordsets = var.recordsets
}
