
output "secret_arn" {
  description = "ARN of the secret that has the github token"
  value       = module.secerts.secret_arn
}

output "token_arn" {
  description = "ARN of the secret that has the github token"
  value       = module.cloud9.kms_id
}

output "s3_bucket" {
  description = "ARN of the S3 bucket ot house code"
  value       = module.cloud9.s3_bucket
}

output "cloud9_ide" {
  description = "ARN of the Cloud9 IDE"
  value       = module.cloud9.cloud9
}
