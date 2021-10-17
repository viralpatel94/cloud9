
output "kms_id" {
  description = "The kms ARN of the key"
  value       = module.kms_key.key_arn
}

output "s3_bucket" {
  description = "The S3 bucket ARN"
  value       = resource.aws_s3_bucket.b.id
}

output "cloud9" {
  description = "The S3 bucket ARN"
  value       = resource.aws_cloudformation_stack.cloud9.outputs["Cloud9ARN"]
}
