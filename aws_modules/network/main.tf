resource "aws_vpc" "vpcs" {
  for_each    = var.vpcs
  region      = each.value.region
  cidr_block  = each.value.cidr_block
}

resource "aws_subnet" "subnets" {
  for_each          = var.subnets
  availability_zone = each.value.az
  vpc_id            = aws_vpc.vpcs[each.value.vpc].id
  cidr_block        = each.value.cidr_block
}

resource "aws_security_group" "sec_groups" {
  for_each    = var.sec_groups
  name        = each.value.name
  description = each.value.description
  vpc_id      = aws_vpc.vpcs[each.value.vpc].id
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {
  for_each          = var.ingress_rules
  security_group_id = aws_security_group.sec_groups[each.value.sec_group].id
  ip_protocol       = each.value.ip_protocol
  cidr_ipv4         = each.value.cidr_ipv4
  from_port         = each.value.from_port
  to_port           = each.value.to_port
}

resource "aws_vpc_security_group_egress_rule" "egress_rules" {
  for_each          = var.egress_rules
  security_group_id = aws_security_group.sec_groups[each.value.sec_group].id
  ip_protocol       = each.value.ip_protocol
  cidr_ipv4         = each.value.cidr_ipv4
  from_port         = each.value.from_port
  to_port           = each.value.to_port
}

resource "aws_internet_gateway" "gateways" {
  vpc_id = aws_vpc.vpcs["main_vpc"].id
}

resource "aws_route_table" "route_tables" {
  for_each  = var.route_tables
  vpc_id = aws_vpc.vpcs[each.value.vpc].id
}

resource "aws_route" "routes" {
  for_each  = var.routes
  gateway_id  = aws_internet_gateway.gateways.id
  route_table_id  = aws_route_table.route_tables[each.value.route_table].id
  destination_cidr_block  = each.value.cidr_block
}

resource "aws_route_table_association" "table_associations" {
  for_each       = var.route_tables
  subnet_id      = aws_subnet.subnets[each.value.subnet].id
  route_table_id = aws_route_table.route_tables[each.key].id
}
