terraform {
    required_providers {
      google = {
        source = "hashicorp/google"
        version = "~> 3.5"
      }
    }
}

provider "google" {
  project = "arcane-boulder-310022"
  region = "US"
}