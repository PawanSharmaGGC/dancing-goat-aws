variable "project_name" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "sg_db_id" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}
