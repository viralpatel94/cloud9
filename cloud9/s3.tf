resource "aws_s3_bucket" "b" {
  bucket        = "${var.name}-codebucket-debugging"
  force_destroy = true
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = module.kms_key.key_arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

data "template_file" "init" {
  template = file("${path.module}/s3_clone.tpl")
  vars = {
    bucket = "${aws_s3_bucket.b.id}"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket  = aws_s3_bucket.b.id
  key     = "clone.sh"
  content = data.template_file.init.rendered

}
