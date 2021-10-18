locals {
  timestamp           = timestamp()
  timestamp_sanitized = replace("${local.timestamp}", "/[- TZ:]/", "")

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

resource "aws_dynamodb_table" "alert_log" {
  name           = "alert-log"
  hash_key       = "messageID"
  read_capacity  = 20
  write_capacity = 20


  attribute {
    name = "messageID"
    type = "S"
  }

}

resource "aws_dynamodb_table_item" "alert_log_counter_item" {
  table_name = aws_dynamodb_table.alert_log.name
  hash_key   = aws_dynamodb_table.alert_log.hash_key

  item = <<ITEM
{
    "messageID": {"S": "counter"},
    "message": {"S":"0"}
}
ITEM
}
