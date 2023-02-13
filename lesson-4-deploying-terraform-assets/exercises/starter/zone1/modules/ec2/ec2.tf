resource "aws_instance" "ubuntu" {
  ami           = ami-0c7a123711a0cb8f2
  count = 1
  instance_type = t3.micro
  subnet_id = var.public_subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = ""
  }
}

resource "aws_security_group" "ec2_sg" {
 
}