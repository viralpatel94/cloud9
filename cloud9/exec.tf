data "aws_secretsmanager_secret" "token" {
  arn = var.secret_arn
}


data "aws_secretsmanager_secret_version" "token_value" {
  secret_id = data.aws_secretsmanager_secret.token.id
}


resource "null_resource" "cp-repo" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
              git clone https://${data.aws_secretsmanager_secret_version.token_value.secret_string}@github.com/${var.owner}/${var.repo}.git
              aws s3 cp ${var.repo} s3://${aws_s3_bucket.b.id}/ --recursive  AWS_ACCESS_KEY_ID=${var.access_key} AWS_SECRET_ACCESS_KEY=${var.secret_key}
              rm -rf ${var.repo}
    EOT
  }
}
