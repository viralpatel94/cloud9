# locals {
#   timestamp           = timestamp()
#   timestamp_sanitized = replace("${local.timestamp}", "/[- TZ:]/", "")
#   object              = { "team_id-repo_name" : { "S" : "stuff" } }
#
#
# }
#
#
#
#
# resource "aws_dynamodb_table_item" "inventory" {
#   table_name = "client-environments"
#   hash_key   = "team_id-repo_name"
#
#   item = jsonencode(
#     {
#       "team_id-repo_name" : { "S" : "${var.team_id-repo_name}" },
#       "CreateDate" : { "S" : "${local.timestamp_sanitized}" },
#       "S3" : { "S" : "${module.cloud9.s3_bucket}" },
#       "Cloud9" : { "S" : "${module.cloud9.cloud9}" },
#       "KMS" : { "S" : "${module.cloud9.kms_id}" },
#       "ActiveDays" : { "N" : "1" },
#       "DaysRemaining" : { "N" : "7" },
#       "CreatorName" : { "S" : "${var.CS_Creator_Full_Name}" },
#       "AccessKey" : { "S" : "${var.access_key}" }
#     }
#   )
#
# }

# resource "aws_dynamodb_table_item" "inventory" {
#   table_name = "client-environments"
#   hash_key   = "clientabc"
#
#   item = jsonencode(
#     {
#       "ClientName" : { "S" : "clientabc" },
#       "CreateDate" : { "S" : "20211017224407" },
#       "S3" : { "S" : "arn:aws:s3:::clientabc-codebucket-debugging" },
#       "Cloud9" : { "S" : "arn:aws:cloud9:us-east-1:439380838513:environment:e743ea9743504f11947dfb5192fe61ed" },
#       "KMS" : { "S" : "arn:aws:kms:us-east-1:439380838513:key/55f5f5d5-5329-4d40-9eca-6a687c86c9f0}" },
#       "ActiveDays" : { "N" : "1" },
#       "DaysRemaining" : { "N" : "7" },
#       "CreatorName" : { "S" : "Viral Patel" }
#     }
#   )
#
# }
