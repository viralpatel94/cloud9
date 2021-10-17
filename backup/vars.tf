variable "kms_arn" {
  description = "KMS Key ARN"
  type        = string
  default     = ""
}

variable "vault_name" {
  description = "Name of the vault"
  type        = string
}

variable "plan_name" {
  description = "Name of the plan"
  type        = string
}

variable "cron_expression" {
  description = "The cron expression to kickoff backups"
  type        = string
  default     = "cron(0	0	?	*	*	*)"
}

variable "backup_key" {
  description = "The key to use for target backup"
  type        = string
}

variable "backup_value" {
  description = "The value to use for target backup"
  type        = string
}
