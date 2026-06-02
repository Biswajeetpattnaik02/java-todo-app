# Lookup latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Optional key pair from local public key
resource "aws_key_pair" "generated" {
  count      = var.public_key_path != "" ? 1 : 0
  key_name   = var.key_name != "" ? var.key_name : "todo-key"
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "web" {
  name   = "${var.vpc_name}-web-sg"
  vpc_id = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-web-sg"
  }
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.amazon_linux2.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  key_name = var.key_name != "" ? var.key_name : (length(aws_key_pair.generated) > 0 ? aws_key_pair.generated[0].key_name : null)

  tags = {
    Name = "${var.vpc_name}-web"
  }
}
