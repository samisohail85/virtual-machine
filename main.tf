provider "google" {
  project = "kube-project-380713"
  region  = "europe-north1"
  zone    = "europe-north1-a"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc.self_link
      }
}
resource "google_compute_network" "vpc" {
  name = "my-vpc"
}
