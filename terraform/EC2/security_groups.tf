
# Security group for private ssh connection and port 3000

resource "aws_security_group" "allow_ssh_8080" {
  name        = "allow_ssh_8080"
  description = "Allow ssh and port 8080 inbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "allow_ssh_8080"
  }
}

resource "aws_security_group_rule" "public_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_ssh_8080.id
}

resource "aws_security_group_rule" "public_in_8080" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_ssh_8080.id
}

resource "aws_security_group_rule" "app_allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_ssh_8080.id
}
 
 
