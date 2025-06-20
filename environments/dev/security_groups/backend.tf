terraform {
  backend "s3" {
    bucket         = "homelab-tfstatefile-2025-1"
    key            = "dev/sg.tfstate"
    region         = "us-east-1"
    encrypt = true
    use_lockfile = true #Native S3  locking
  }
}