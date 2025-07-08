output "public_ip" {
  value = google_compute_instance.backend_vm.network_interface[0].access_config[0].nat_ip
}

output "service_account_email" {
  value = google_service_account.backend_sa.email
}