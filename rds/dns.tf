module "dns_host_name" {
  source    = "git::https://github.com/matkovskiy/tf-modules.git//aws-route53-cluster-hostname"
  version  = "0.12.0"
  enabled  = length(var.dns_zone_id) > 0 && module.this.enabled
  dns_name = var.host_name
  zone_id  = var.dns_zone_id
  records  = coalescelist(aws_db_instance.default.*.address, [""])
  context  = module.this.context
}
