resource "google_storage_bucket" "frontend_bucket" {
  name     = var.bucket_name
  location = var.bucket_location
  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }
  force_destroy = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "public" {
  bucket = google_storage_bucket.frontend_bucket.name
  role   = "roles/storage.objectViewer"
  members = ["allUsers"]
}


resource "google_storage_bucket_object" "angular_files" {
  for_each = fileset(var.build_dir, "**")

  name   = each.value
  bucket = google_storage_bucket.frontend_bucket.name
  source = "${var.build_dir}/${each.value}"

  content_type = lookup(
    var.mime_types,
    lower(reverse(split(".", each.value))[0]),
    "application/octet-stream"
  )

  depends_on = [google_storage_bucket.frontend_bucket]
}




