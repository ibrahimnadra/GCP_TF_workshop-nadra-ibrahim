# modules/bucket/main.tf
resource "google_storage_bucket" "my_bucket" {
  name         = var.bucket_name
  location     = var.bucket_location
  storage_class = "standard"
  uniform_bucket_level_access = true
}