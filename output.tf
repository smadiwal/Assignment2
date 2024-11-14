output "ec2ip1" {
  value = aws_subnet.Websubnettest.vpc_id
}
output "ec2ip11" {
  value = aws_subnet.Websubnettest.cidr_block
}