resource "aws_instance" "web" {
  ami                         = "ami-0faab6bdbac9486fb" 
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.main_subnet.id
  vpc_security_group_ids      = [aws_security_group.ssh_sg.id]
  associate_public_ip_address = true
  key_name      = "mein-key-pair"

  tags = {
    Name = "example-instance"
  }
}

