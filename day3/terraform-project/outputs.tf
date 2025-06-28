output "public_ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}

output "bucket_url" {
  value = google_storage_bucket.static_bucket.url
}