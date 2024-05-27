resource "aws_eip" "eip1" {
  depends_on = [aws_internet_gateway.igw]


  tags = {
    Name = "${local.env}-IP-nat1"
  }
}


resource "aws_eip" "eip2" {
  depends_on = [aws_internet_gateway.igw]


  tags = {
    Name = "${local.env}-IP-nat2"
  }
}
