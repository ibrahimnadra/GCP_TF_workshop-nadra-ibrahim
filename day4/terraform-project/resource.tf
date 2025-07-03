# Resource definitions for the main project
module "env_vm" {
  source = "./modules/vm"
  vm_name = var.env_vm_name
}

module "env_bucket" {
  source = "./modules/bucket"
  bucket_name = var.env_bucket_name
}