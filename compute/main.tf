# --- compute/main.tf ---

data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "random_id" "custom_node_id" {
  byte_length = 2
  count       = var.instance_count

  keepers = {
    key_name = var.key_name
  }
}

resource "aws_key_pair" "custom_auth" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)

}

resource "aws_instance" "custom_node" {
  count                  = var.instance_count
  instance_type          = var.instance_type
  ami                    = data.aws_ami.server_ami.id
  vpc_security_group_ids = [var.public_sg]
  subnet_id              = var.public_subnets[count.index]
  key_name               = aws_key_pair.custom_auth.id
  user_data = templatefile(var.user_data_path,
    {
      nodename    = "node-${random_id.custom_node_id[count.index].dec}"
      db_endpoint = var.db_endpoint
      dbname      = var.dbname
      dbuser      = var.dbuser
      dbpassword  = var.dbpassword
    }
  )

  root_block_device {
    volume_size = var.vol_size
  }

  provisioner "local-exec" {
    command = templatefile("${path.cwd}/scp_script.tpl",
      {
        nodeip   = self.public_ip
        k3s_path = "${path.cwd}/../"
        nodename = self.tags.Name
      }
    )
  }

  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "91931"
      host = self.public_ip
      private_key = file("~/.ssh/terra-key")
    }
    script = "${path.cwd}/delay.sh"
  }

  tags = {
    Name = "node-${random_id.custom_node_id[count.index].dec}"
  }
}

resource "aws_lb_target_group_attachment" "tg_attach" {
  count            = var.instance_count
  target_group_arn = var.lb_target_group_arn
  target_id        = aws_instance.custom_node[count.index].id
  port             = var.tg_port
}