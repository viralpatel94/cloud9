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

# variable "token" {
#   description = "The token for clone a repo"
#   type        = string
#   sensitive   = true
# }

variable "owner" {
  description = "The owner of the repo"
  type        = string
}

variable "repo" {
  description = "The name of the repo"
  type        = string
}
