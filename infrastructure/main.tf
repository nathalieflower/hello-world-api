module "service" {
  source = "./modules/service"
  lambda_function_name = var.lambda_function_name
}
