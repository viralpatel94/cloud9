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
  description = "The GitHub token for clone a repo"
  type        = string
  sensitive   = true
}

variable "owner" {
  description = "The owner of the GitHub repo"
  type        = string
}

variable "repo" {
  description = "The name of the GitHub repo"
  type        = string
}

variable "tf_org" {
  description = "The terraform organization in which the VPC exists"
  type        = string
}

variable "tf_workspace" {
  description = "The terraform workspace in which the VPC exists"
  type        = string
}
