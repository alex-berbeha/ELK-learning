resource "google_compute_network" "project-network" {
  name                    = "${var.vpc_name}-vpc"
}