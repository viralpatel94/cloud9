locals {
  timestamp           = timestamp()
  timestamp_sanitized = replace("${local.timestamp}", "/[- TZ:]/", "")

}




resource "aws_dynamodb_table_item" "inventory" {
  table_name = "client-environments"
  hash_key   = var.name

  item = <<ITEM
{
  "ClientName": {"S": ${var.name}},
  "CreateDate": {"S": "${local.timestamp_sanitized}"},
  "S3": {"S": "${module.cloud9.s3_bucket}"},
  "Cloud9": {"S": "${module.cloud9.cloud9}"},
  "KMS": {"S": "${module.cloud9.kms_id}"},
  "ActiveDays": {"N": "1"},
  "DaysRemaining": {"N": "7"},
  "CreatorName": {"S": ${var.creator}}
}
ITEM
}
