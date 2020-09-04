module "service" {
  source = "./modules/service"
  lambda_function_name = var.lambda_function_name
}


#put information for state s3 bucket here.
terraform {
  backend "s3" {
    bucket = "hello-world-api-state-bucket"
    key    = "terraform/state/hello-world"
    region = "eu-west-2"
  }
}