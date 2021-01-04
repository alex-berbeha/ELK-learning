resource "google_compute_network" "project-network" {
  name                    = "${var.vpc_name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "project-subnet" {
  name                     = "${var.subnet_name}-subnet"
  ip_cidr_range            = "10.0.1.0/28"
  private_ip_google_access = "true"
  network                  = "${google_compute_network.project-network.id}"
  region                   = "europe-north1"
}