
module "s3" {
  source          = "./modules/s3"
  s3_bucket_name  = var.s3_bucket_name
  kms_alias       = var.kms_alias
}

module "dynamodb" {
  source              = "./modules/dynamodb"
  dynamodb_table_name = var.dynamodb_table_name
}
