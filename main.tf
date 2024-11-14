resource "aws_subnet" "Websubnettest" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.222.20.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Websubnettest"
  }
}
resource "aws_subnet" "Websubnet22" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.222.21.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Websubnet22"
  }
}

resource "aws_security_group" "dev-sg1" {
  name        = "dev-web-ssh-sg1"
  vpc_id      = var.vpc_id
  description = "Dev web server traffic allowed ssh & http"

}

resource "aws_vpc_security_group_ingress_rule" "dev-ingress-22" {
  security_group_id = aws_security_group.dev-sg1.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "dev-ingress-80" {
  security_group_id = aws_security_group.dev-sg1.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "dev-egress" {
  security_group_id = aws_security_group.dev-sg1.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}
    