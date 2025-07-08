resource "google_service_account" "backend_sa" {
  account_id   = var.service_account_name
  display_name = "Backend Service Account"
}

resource "google_project_iam_member" "backend_sa_monitoring" {
  role   = "roles/monitoring.metricWriter"
  member = "serviceAccount:${google_service_account.backend_sa.email}"
  project = var.project_id
}

resource "google_project_iam_member" "backend_sa_logging" {
  role   = "roles/logging.logWriter"
  member = "serviceAccount:${google_service_account.backend_sa.email}"
  project = var.project_id
}