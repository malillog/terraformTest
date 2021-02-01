data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id = aws_subnet.subred1.id
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  key_name = var.key_name
  depends_on = [aws_internet_gateway.gw]
  
  tags = {
    Name = var.instance_name
  }
}
