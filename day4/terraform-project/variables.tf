variable "project" {
  description = "The name of the GCP project"
  type        = string
  default = "day4-pi-shaped-workshop-464806"
}

variable "region" {
  description = "The GCP region where resources will be created"
  type        = string
  default = "us-central1"
}

variable "zone" {
  description = "The GCP zone where resources will be created"
  type        = string
  default = "us-central1-c"
}

# Should be passed as per the environment value file
variable "env_bucket_name" {
    description = "The name of the VM instance"
    type        = string
}

# Should be passed as per the environment value file
variable "env_vm_name" {
    description = "The name of the VM instance"
    type        = string
}
