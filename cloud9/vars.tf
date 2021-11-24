variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The instance type of the cloud9 instance"
  type        = string
  default     = "m5.large"
}

variable "subnet" {
  description = "The id of the public subnet"
  type        = string
}

variable "secret_arn" {
  description = "The arn of the github token"
  type        = string
}

variable "Github_repo_owner" {
  description = "The owner of the repo"
  type        = string
}

variable "Github_repo_name" {
  description = "The name of the repo"
  type        = string
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

variable "CS_Creator_Email" {
  description = "Vercel email of the person deploying the instance"
  type        = string
}
