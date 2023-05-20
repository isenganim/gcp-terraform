terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.65.2"
    }
  }
}

provider "google" {
  credentials = file(var.path)
  project     = var.project
  region      = var.region
  zone        = var.zone
}
