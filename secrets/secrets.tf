resource "aws_secretsmanager_secret" "token" {
  name = var.secret_name
  # kms_key_id = var.kms_arn
}

resource "aws_secretsmanager_secret_version" "token_update" {
  secret_id     = aws_secretsmanager_secret.token.id
  secret_string = var.token_value
}

resource "aws_secretsmanager_secret_policy" "example" {
  secret_arn = aws_secretsmanager_secret.token.arn

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "EnableAllPermissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "secretsmanager:GetSecretValue",
      "Resource": "*"
    }
  ]
}
POLICY
}
