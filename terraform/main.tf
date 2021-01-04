resource "google_compute_network" "project-network" {
  name                    = "${var.vpc_name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "project-subnet" {
  name                     = "${var.subnet_name}-subnet"
  ip_cidr_range            = "10.0.1.0/28"
  private_ip_google_access = "true"
  network                  = google_compute_network.project-network.id
  region                   = "europe-north1"
}

resource "google_compute_firewall" "allow-all-internal" {
  name    = "allow-all-internal"
  network = google_compute_network.project-network.id
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "icmp"
  }
  source_ranges = ["10.0.1.0/28"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.project-network.id
  allow {
    protocol = "tcp"
    ports    = [22]
  }

  source_ranges = ["0.0.0.0/0"]
}