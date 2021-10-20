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
              git clone https://${data.aws_secretsmanager_secret_version.token_value.secret_string}@github.com/${var.Github_repo_owner}/${var.Github_repo_name}.git
              AWS_ACCESS_KEY_ID=${var.access_key} AWS_SECRET_ACCESS_KEY=${var.secret_key} aws s3 cp ${var.Github_repo_name} s3://${aws_s3_bucket.b.id}/ --recursive
              rm -rf ${var.Github_repo_name}
    EOT
  }
}
