variable "kms_arn" {
  description = "KMS Key ARN"
  type        = string
  default     = ""
}

variable "secret_name" {
  description = "Name of the secret"
  type        = string
}

variable "token_value" {
  description = "The secret string of the git token"
  type        = string
  sensitive   = true
}
