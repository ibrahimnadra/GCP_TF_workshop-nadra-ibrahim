terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "default" {
  name         = "demo-vm-linux"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-12-bookworm-v20250610"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

# Edited the file to add a bucket to the project
resource "google_storage_bucket" "static_bucket" {
  name         = "pi-shaped-demo-bucket"
  location     = "us"
  storage_class = "standard"
  uniform_bucket_level_access = true
}