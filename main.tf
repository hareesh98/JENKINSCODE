resource "aws_key_pair" "terraform" {
  key_name   = "terraform"
  public_key = "${file("${path.module}/a.pub")}"
}

resource "aws_instance" "test_server" {
  ami           = var.ami 
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  monitoring = var.monitoring
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id
  key_name = aws_key_pair.a.key_name
  tags = var.tags
  timeouts {
    create = "60m"
  }
}