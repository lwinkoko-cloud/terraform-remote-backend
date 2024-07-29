output "s3_bucket_name" {
  value = resource.aws_s3_bucket.my_s3_bucket_name.id
}

output "dynamodb_table" {
  value = resource.aws_dynamodb_table.my_dynamodb_table.id
}