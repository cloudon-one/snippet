module "cloud-dns" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "4.1.0"
  domain = "stg.keywordinsights.tech."
  name = "stg-keywordinsights-tech"
  type = "public"

  project_id = var.project_id
  recordsets = var.recordsets
}