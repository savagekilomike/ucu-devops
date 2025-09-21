terraform {
  backend "gcs" {
    bucket = "dizzygrain-terraform-state-bucket"
    prefix = "terraform/state"
  }
}
