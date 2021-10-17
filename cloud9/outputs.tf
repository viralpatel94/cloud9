# VPC
output "kms_id" {
  description = "The kms ARN of the key"
  value       = module.kms_key.key_arn
}
