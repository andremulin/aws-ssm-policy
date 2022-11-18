resource "aws_vpc_endpoint" "endpoint" {
  count               = var.vpcs[0].id == "" ? 0 : length(var.vpcs)
  service_name        = "com.amazonaws.${aws_region.current.name}.ssm"
  vpc_id              = var.vpcs[count.index].id
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.vpcs[count.index].security_group_ids
}