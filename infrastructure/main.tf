provider "aws" {
  region = "eu-west -2"
}

# create s3 bucket for storing code
resource "aws_s3_bucket" "bucket" {
  bucket = "hello-world-ctm"
  acl    = "private"

  versioning {
    enabled = true
  }
}

  aws s3 cp example.zip s3://hello-world-ctm/v1.0.0/hello-world.zip

# think about pipelines and how code is deployed into s3

# create lambda that gets code from s3

# create api gateway

