# modules/vm/main.tf
resource "google_compute_instance" "my_vm" {
  name         = var.vm_name
  zone         = var.vm_name
  machine_type = "e2-medium"

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