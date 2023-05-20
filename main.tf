resource "random_string" "random" {
  length  = 5
  lower   = true
  special = false
  upper   = false
}

resource "google_compute_address" "staticip" {
  name = "${var.gcp_vm_name}-${random_string.random.result}-static"
}

resource "google_compute_instance" "gcp_vm" {
  name         = "${var.gcp_vm_name}-${random_string.random.result}"
  zone         = var.zone
  machine_type = var.gcp_vm_type

  boot_disk {
    initialize_params {
      image = var.os_image
      size  = var.disk_size
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnetwork.name
    access_config {
      nat_ip = google_compute_address.staticip.address
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_key}"
  }

  tags = ["${var.gcp_vm_name}-${random_string.random.result}"]

}
