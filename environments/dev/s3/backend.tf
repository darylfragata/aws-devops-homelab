terraform {
  backend "s3" {
    bucket         = "my-homelab-tfstatefile-1"
    key            = "dev/s3.tfstate"
    region         = "us-east-1"
    encrypt = true
    use_lockfile = true #Native S3  locking
  }
}
