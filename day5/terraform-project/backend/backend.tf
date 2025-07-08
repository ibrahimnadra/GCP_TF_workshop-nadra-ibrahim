resource "google_compute_instance" "backend_vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.vm_zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  service_account {
    email  = google_service_account.backend_sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    echo "Starting backend VM setup..."
    sudo apt update
    echo "Installing python3 pipx..."
    sudo apt install -y python3-pip
    echo "Installing git..."
    sudo apt install -y git
    echo "Installing coreutils..."
    sudo apt install -y coreutils
    echo "Cloning the guess-game-full-stack-app repository..."
    git clone https://github.com/ibrahimnadra/guess-game-full-stack-app.git /tmp/guess-game-full-stack-app
    echo "Installing Python 3.11 virtual environment..."
    sudo apt install -y python3.11-venv
    echo "Setting up the virtual environment..."
    python3 -m venv venv
    echo "Activating the virtual environment..."
    source venv/bin/activate
    echo "Installing required Python package: flask-cors..."
    pip install flask flask-cors
    echo "Running the Flask API..."
    python3 /tmp/guess-game-full-stack-app/guess-game-be/guess_game.py
  EOT
}
# Firewall rule to allow traffic to the Flask API
resource "google_compute_firewall" "allow_flask_api" {
  name    = "allow-flask-api"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = [var.api_port]
  }
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}

# Monitoring Uptime Check Configuration for the Flask API
resource "google_monitoring_uptime_check_config" "api_uptime" {
  display_name = "API Uptime Check"
  timeout      = "10s"
  period       = "60s"

  http_check {
    path = "/"
    port = var.api_port
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      host = google_compute_instance.backend_vm.network_interface[0].access_config[0].nat_ip
    }
  }
}




