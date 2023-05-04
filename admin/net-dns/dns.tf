module "cloud-dns" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "4.2.0"
  domain = ""
  name = ""
  type = "public"
  project_id = var.project_id
  recordsets = var.recordsets
}