module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "ventura-assignment-bucket"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }

  

}
  

resource "aws_s3_bucket_logging" "example" {
  bucket = module.s3_bucket.s3_bucket_id

  target_bucket = module.s3_bucket.s3_bucket_id
  target_prefix = "log/"
}
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket =  module.s3_bucket.s3_bucket_id

  rule {
    apply_server_side_encryption_by_default {
    #   kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "AES256"
    }
  }
}



# resource "aws_s3_bucket_website_configuration" "example" {
#   bucket = aws_s3_bucket.example.id

#   index_document {
#     suffix = "index.html"
#   }

#   error_document {
#     key = "error.html"
#   }

#   routing_rule {
#     condition {
#       key_prefix_equals = "docs/"
#     }
#     redirect {
#       replace_key_prefix_with = "documents/"
#     }
#   }
# }