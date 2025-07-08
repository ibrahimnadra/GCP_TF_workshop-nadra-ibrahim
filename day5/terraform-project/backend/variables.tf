variable "project_id" {
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

variable "vm_name" {
    description = "The name of the virtual machine to create"
    type        = string
    default     = "guess-game-backend-vm"
}

variable "machine_type" {
    description = "The type of machine to create"
    type        = string
    default     = "e2-medium"
}

variable "vm_zone" {
    description = "The zone where the virtual machine will be created"
    type        = string
    default     = "us-central1-a"
}

variable "api_port" {
    description = "The port on which the Flask API will run"
    type        = string
    default     = "8080"
}


variable "service_account_name" {
    description = "Name of the service account for the backend VM"
    default     = "backend-service-account"
}