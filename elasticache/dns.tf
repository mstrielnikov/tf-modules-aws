#
# CloudWatch Resources
#

module "dns" {
  source  = "git::https://github.com/matkovskiy/tf-modules.git//aws-null-label?ref=tags/0.0.25"
  version = "0.12.0"

  enabled  = module.this.enabled && var.zone_id != "" ? true : false
  dns_name = var.dns_subdomain != "" ? var.dns_subdomain : module.this.id
  ttl      = 60
  zone_id  = var.zone_id
  records  = var.cluster_mode_enabled ? [join("", aws_elasticache_replication_group.default.*.configuration_endpoint_address)] : [join("", aws_elasticache_replication_group.default.*.primary_endpoint_address)]

  context = module.this.context
}
