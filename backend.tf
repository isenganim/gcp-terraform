terraform {
  backend "gcs" {
    bucket      = "djelajah-tf"
    prefix      = "terraform/state/instances"
    credentials = "./djelajah-68250f2c6e00.json"
  }
}
