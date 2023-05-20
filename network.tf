resource "google_compute_network" "vpc_network" {
  name                    = "${var.gcp_vm_name}-${random_string.random.result}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "${var.gcp_vm_name}-${random_string.random.result}-subnetwork"
  region        = var.region
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.130.0.0/20"
}

resource "google_compute_firewall" "ssh" {
  name    = "${var.gcp_vm_name}-${random_string.random.result}-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }

  target_tags   = ["${var.gcp_vm_name}-${random_string.random.result}"]
  source_ranges = ["0.0.0.0/0"]
}
