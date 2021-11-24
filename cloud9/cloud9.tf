resource "aws_cloudformation_stack" "cloud9" {
  name         = var.name
  capabilities = ["CAPABILITY_IAM"]
  parameters = {
    C9InstanceType = var.instance_type
    Subnet         = var.subnet
    S3Bucket       = aws_s3_bucket.b.id
    Name           = var.name
    CreatorEmail   = var.CS_Creator_Email
  }
  template_body = file("./cloud9/cloud9_instance.yml")
}
