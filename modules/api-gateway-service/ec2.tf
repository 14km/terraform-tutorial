resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu
  instance_type = "t2.micro"
  key_name      = "tf-key-pair"
  root_block_device {
    // GB 단위
    volume_size = 30
    volume_type = "gp2"
  }

  tags = {
    Name = "AppServerInstance"
  }
}

data "aws_ami" "ubuntu" {
  // 가장 최근의 값
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
