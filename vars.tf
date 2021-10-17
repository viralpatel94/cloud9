variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "region" {
  description = "region used for AZ"
  type        = string
  default     = ""
}

variable "access_key" {
  description = "Access key used to deploy into AWS"
  type        = string
  sensitive   = true
  default     = ""
}

variable "secret_key" {
  description = "Secert key used to deploy into AWS"
  type        = string
  sensitive   = true
  default     = ""
}

variable "instance_type" {
  description = "The instance type of the cloud9 instance"
  type        = string
  default     = "m5.large"
}

variable "token" {
  description = "The token for clone a repo"
  type        = string
  sensitive   = true
}

variable "owner" {
  description = "The owner of the repo"
  type        = string
}

variable "repo" {
  description = "The name of the repo"
  type        = string
}
