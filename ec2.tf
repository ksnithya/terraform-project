
locals {
  inbound_ports = [22, 80, 8080, 3306, 5432]
}
resource "aws_security_group" "ec2_SG" {
  name = "ec2_SG"
  description = "Allow TLS inbound traffic"
 # vpc_id      = aws_vpc.myvpc.id
  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  #subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_SG.id]
  user_data              = file("./user.sh")
  tags = {
    Name = "myec2"
  }
}