resource "aws_vpc_endpoint" "ssm" {
  count               = var.vpcs[0].id == "" ? 0 : length(var.vpcs)
  service_name        = "com.amazonaws.${data.aws_region.current.name}.ssm"
  vpc_id              = var.vpcs[count.index].id
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.vpcs[count.index].security_group_ids
}

resource "aws_vpc_endpoint" "ssmmessages" {
  count               = var.vpcs[0].id == "" ? 0 : length(var.vpcs)
  service_name        = "com.amazonaws.${data.aws_region.current.name}.ssmmessages"
  vpc_id              = var.vpcs[count.index].id
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.vpcs[count.index].security_group_ids
}

resource "aws_vpc_endpoint" "ec2messages" {
  count               = var.vpcs[0].id == "" ? 0 : length(var.vpcs)
  service_name        = "com.amazonaws.${data.aws_region.current.name}.ssmmessages"
  vpc_id              = var.vpcs[count.index].id
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.vpcs[count.index].security_group_ids
}