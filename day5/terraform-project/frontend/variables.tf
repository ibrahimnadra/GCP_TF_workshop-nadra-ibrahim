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

variable "bucket_name" {
    description = "The name of the storage bucket to create"
    type        = string
    default     = "guess-game-frontend"
}

variable "bucket_location" {
    description = "The location of the storage bucket"
    type        = string
    default     = "us"
}

variable "build_dir" {
    description = "The directory containing the built Angular application files"
    type        = string
    default     = "../../guess-game-full-stack-app/guess-game-fe/dist/angular-demo/browser"
}

variable "mime_types" {
    type = map(string)
    default = {
        html  = "text/html"
        css   = "text/css"
        js    = "application/javascript"
        ico   = "image/ico"
    }
}


