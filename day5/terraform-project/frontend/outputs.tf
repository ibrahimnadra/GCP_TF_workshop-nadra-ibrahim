output "build_files" {
  value = fileset(var.build_dir, "**")
}

output "frontend_url" {
  value = "http://storage.googleapis.com/${var.bucket_name}/index.html"
}
