#
# Allow All Traffic
#
resource "aws_security_group" "allow_all" {
  vpc_id = "${var.vpc-id}"
  name = "allow_all"
    description = "allow_all"

  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      self = true
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_all"
  }
}
#
# Allow ELB HTTP Access
#
resource "aws_security_group" "elb_allow_http" {
  vpc_id = "${var.vpc-id}"
  name = "elb_allow_http"
  description = "elb_allow_http"

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "elb_allow_http"
  }
}
#
# Allow HTTP Access from ELB
#
resource "aws_security_group" "allow_http" {
  vpc_id = "${var.vpc-id}"
  name = "allow_http"
  description = "allow_http"

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      security_groups = ["${aws_security_group.elb_allow_http.id}"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_http"
  }
}
#
# Allow SSH Access from Source IP
#
resource "aws_security_group" "allow_ssh" {
  vpc_id = "${var.vpc-id}"
  name = "allow_ssh"
    description = "allow_ssh"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${var.ssh_allow_ip}"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_ssh"
  }
}
