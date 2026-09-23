variable "puerto_web_dev" {
  description = "Puerto externo del frontend DEV"
  type        = number
}

variable "puerto_api_dev" {
  description = "Puerto externo del backend DEV"
  type        = number
}

variable "puerto_bd_dev" {
  description = "Puerto externo de la BD DEV"
  type        = number
}

variable "puerto_web_qa" {
  description = "Puerto externo del frontend QA"
  type        = number
}

variable "puerto_api_qa" {
  description = "Puerto externo del backend QA"
  type        = number
}

variable "puerto_bd_qa" {
  description = "Puerto externo de la BD QA"
  type        = number
}

variable "db_user" {
  description = "Usuario de PostgreSQL"
  type        = string
}

variable "db_password" {
  description = "Contraseña de PostgreSQL"
  type        = string
  sensitive   = true
}