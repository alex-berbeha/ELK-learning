  
module "main-vpc" {
  source                  = "github.com/alex-berbeha/terraform-modules.git/modules/vpc"
  vpc_name                = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
}