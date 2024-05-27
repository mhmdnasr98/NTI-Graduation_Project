resource "aws_nat_gateway" "natGW1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.public_zone1.id

  tags = {
    Name = "${local.env}-nat1"
  }

}

resource "aws_nat_gateway" "natGW2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.public_zone2.id

  tags = {
    Name = "${local.env}-nat2"
  }

}
