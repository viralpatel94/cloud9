{
   "ClientName" : { "S" : "${name}" },
   "CreateDate" : { "S" : "${timestamp_sanitized}" },
   "S3" : { "S" : "${s3_bucket}" },
   "Cloud9" : { "S" : "${cloud9}" },
   "KMS" : { "S" : "${kms_id}" },
   "ActiveDays" : { "N" : "1" },
   "DaysRemaining" : { "N" : "7" },
   "CreatorName" : { "S" : "${creator}" }
}
