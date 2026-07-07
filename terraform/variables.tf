variable "aws_region" {
  default = "ap-south-1"
}

variable "project_name" {
  default = "dancing-goat"
}

variable "db_username" {
  default = "app_user"
}

variable "db_password" {
  sensitive = true
}

variable "db_name" {
  default = "XbyKDG6July"
}
