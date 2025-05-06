variable "bucket_name" {
  type = string
}

variable "tags" {
  description = "Tags for the instance"
  type        = map(string)
}