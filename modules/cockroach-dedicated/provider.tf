terraform {
  required_providers {
    cockroach = {
      source = "cockroachdb/cockroach"
      version = "0.1.0"
    }
  }
}

provider "cockroach" {
  # Configuration options
}