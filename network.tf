resource "google_compute_network" "vpc_network" {
  name                    = "${var.gcp_vm_name}-${random_string.random.result}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name                       = "${var.gcp_vm_name}-${random_string.random.result}-subnetwork"
  region                     = var.region
  network                    = google_compute_network.vpc_network.name
  ip_cidr_range              = var.ip_cidr_range
  stack_type                 = "IPV4_IPV6"
  ipv6_access_type           = "EXTERNAL"
  private_ip_google_access   = true
  private_ipv6_google_access = "ENABLE_BIDIRECTIONAL_ACCESS_TO_GOOGLE"
}

resource "google_compute_firewall" "ssh" {
  name        = "${var.gcp_vm_name}-${random_string.random.result}-firewall"
  network     = google_compute_network.vpc_network.name
  description = "Firewall rule to allow SSH from local machine"

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

resource "google_compute_firewall" "http_https" {
  name        = "${var.gcp_vm_name}-${random_string.random.result}-web"
  network     = google_compute_network.vpc_network.name
  description = "Firewall rule to allow HTTP and HTTPS"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  target_tags   = ["${var.gcp_vm_name}-${random_string.random.result}"]
  source_ranges = ["0.0.0.0/0"]
}
