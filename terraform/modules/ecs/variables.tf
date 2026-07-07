variable "project_name" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "ecr_repository_url" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "sg_app_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "db_connection_string" {
  type      = string
  sensitive = true
}
