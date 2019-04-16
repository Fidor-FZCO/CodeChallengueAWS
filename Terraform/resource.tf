resource "aws_instance" "wordpress" {
  ami = "ami-0a313d6098716f372"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo ec2_instance ansible_host=${aws_instance.wordpress.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/terraform >> ../Ansible/inventory.txt"
  }
  key_name = "${aws_key_pair.terraform.key_name}"
  tags = {
    Name = "WordPress"
  }
}

output "ip" {
  value = "${aws_instance.wordpress.public_ip}"
}

