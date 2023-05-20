terraform {
  backend "gcs" {
    bucket      = "djelajah-tf"
    prefix      = "terraform/state/instances"
    credentials = "./file.json"
  }
}
