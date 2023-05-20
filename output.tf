output "ip_address_ipv4" {
  value = google_compute_instance.gcp_vm.network_interface.0.access_config.0.nat_ip
}

output "ip_address_local" {
  value = google_compute_instance.gcp_vm.network_interface.0.network_ip
}
