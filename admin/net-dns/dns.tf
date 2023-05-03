module "cloud-dns" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "4.2.0"
  domain = "keywordinsights.tech."
  name = "keywordinsights-tech"
  type = "public"
  project_id = "snippet-digital-admin"
  recordsets = var.recordsets
}