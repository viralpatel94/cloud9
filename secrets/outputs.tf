output "secret_arn" {
  description = "ARN of the secret that has the github token"
  value       = aws_secretsmanager_secret.token.id
}
