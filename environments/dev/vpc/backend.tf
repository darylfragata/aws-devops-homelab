terraform {
  backend "s3" {
    bucket         = "my-homelab-tfstatefile-1"
    key            = "dev/vpc.tfstate"
    region         = "us-east-1"
    encrypt = true
    use_lockfile = true #Native S3  locking
  }
}
