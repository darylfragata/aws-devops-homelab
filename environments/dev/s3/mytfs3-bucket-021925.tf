module "s3_bucket-test" {
  source      = "../../../modules/s3"
  bucket_name = "mytfs3-bucket-021925"

  tags = {
    Name = "terraform_state_bucket"
  }

}
