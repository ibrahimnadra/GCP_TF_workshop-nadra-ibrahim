variable "bucket_name" {
    description = "The name of the storage bucket to create"
    type        = string
    default     = "pi-shaped-demo-bucket"
}

variable "bucket_location" {
    description = "The location of the storage bucket"
    type        = string
    default     = "us"
}