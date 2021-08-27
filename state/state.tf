module "state-aws" {
  source = "git::https://github.com/mstrielnikov/tf-module-aws-state.git"
  env                           = var.profile
  force_destroy_enabled         = false
  create_before_destroy_enabled = true
  s3_versioning_enabled         = false
  s3_object_lock_enabled        = "Disabled"
  s3_acl                        = "private"
  s3_block_public_acls          = true
  s3_block_public_policy        = true
  s3_ignore_public_acls         = true
  s3_restrict_public_buckets    = true
  dynamodb_billing_mode         = "PAY_PER_REQUEST"
}