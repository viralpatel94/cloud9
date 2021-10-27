variable "name" {
  description = "Name to be used on all the resources as identifier, this name should also be named the same as the Terraform Cloud Workspace"
  type        = string
  default     = ""
}

variable "CS_Creator_Full_Name" {
  description = "Name of the person who deployed"
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

variable "Github_repo_owner" {
  description = "The owner of the GitHub repo"
  type        = string
}

variable "Github_repo_name" {
  description = "The name of the GitHub repo"
  type        = string
}

variable "tfc_org" {
  description = "The terraform organization in which the VPC exists"
  type        = string
}

variable "tfc_workspace" {
  description = "The terraform workspace in which the VPC exists"
  type        = string
}
