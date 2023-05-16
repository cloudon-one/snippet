terraform {
  backend "gcs" {
    bucket = "your-gcs-remote-tf-state-bucket"
    prefix = "/path/to/your/terrafrom/stat/gcs.tfstate"
  }
}