variable "aws_region" {
  type = string
  default = "us-east-1"
  
}

variable "s3_bucket_name" {
  type = string
  default = my_s3_bucket
  
}

variable "dynamodb_name" {
  description = "dynamodb name"
  type = string
  default = "my_dynamodb_table" 
}

variable "dynamodb_billing_mode" {
  description = "dynamodb_billing mode"
  type = string
  default = "AY_PER_REQUEST"
  
}