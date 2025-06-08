terraform {
  backend "s3" {
    bucket         = "homelab-tfstatefile-2025"
    key            = "dev/iam.tfstate"
    region         = "us-east-1"
    encrypt = true
    use_lockfile = true #Native S3  locking
  }
}
