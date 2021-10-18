locals {
  timestamp           = timestamp()
  timestamp_sanitized = replace("${local.timestamp}", "/[- TZ:]/", "")
  object              = { "ClientName" : { "S" : "stuff" } }


}




# resource "aws_dynamodb_table_item" "inventory" {
#   table_name = "client-environments"
#   hash_key   = "ClientName"
#
#   item = jsonencode(
#     {
#       "ClientName" : { "S" : "${var.name}" },
#       "CreateDate" : { "S" : "${local.timestamp_sanitized}" },
#       "S3" : { "S" : "${module.cloud9.s3_bucket}" },
#       "Cloud9" : { "S" : "${module.cloud9.cloud9}" },
#       "KMS" : { "S" : "${module.cloud9.kms_id}" },
#       "ActiveDays" : { "N" : "1" },
#       "DaysRemaining" : { "N" : "7" },
#       "CreatorName" : { "S" : "${var.creator}" }
#     }
#   )
#
# }


# resource "aws_dynamodb_table_item" "example" {
#   depends_on = [resource.aws_dynamodb_table_item.example]
#
#   table_name = aws_dynamodb_table.example.name
#   hash_key   = aws_dynamodb_table.example.hash_key
#
#   item = jsonencode(local.object)
# }
#
# resource "aws_dynamodb_table" "example" {
#   name           = "example-name"
#   read_capacity  = 10
#   write_capacity = 10
#   hash_key       = "exampleHashKey"
#
#   attribute {
#     name = "exampleHashKey"
#     type = "S"
#   }
# }

resource "null_resource" "dbitem" {

  provisioner "local-exec" {
    command = <<EOT
              AWS_ACCESS_KEY_ID=${var.access_key} AWS_SECRET_ACCESS_KEY=${var.secret_key} aws dynamodb put-item --table-name client-environments --item ${jsonencode(local.object)}
EOT
  }
}
