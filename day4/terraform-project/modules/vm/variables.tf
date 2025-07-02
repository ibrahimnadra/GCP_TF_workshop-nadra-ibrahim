variable "vm_name" {
    description = "The name of the virtual machine to create"
    type        = string
    default     = "pi-shaped-demo-vm"
}

variable "vm_zone" {
    description = "The zone where the virtual machine will be created"
    type        = string
    default     = "us-central1-a"
}