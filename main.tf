provider "google" {
  project = "ucu-devops-2025"
  region  = "us-central1"
  zone    = "us-central1-a"
}

# 1. GCS bucket
resource "google_storage_bucket" "data_bucket" {
  name          = "demo-data-bucket-${random_id.rand.hex}"
  location      = "US"
  force_destroy = true
}

resource "random_id" "rand" {
  byte_length = 4
}

# 2. BigQuery dataset
resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "demo_dataset"
  location                    = "US"
  default_table_expiration_ms = 3600000
}

# 3. VM instance
resource "google_compute_instance" "vm" {
  name         = "demo-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
