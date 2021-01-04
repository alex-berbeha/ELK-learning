provider "google" {
  project     = "elk-learning-300718"
}

terraform {
  backend "gcs" {
    bucket  = "terraform-remote-state-elk-learning"
    prefix  = "terraform/state"
  }
}