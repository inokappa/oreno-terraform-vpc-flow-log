#
# Output
#
output "aws_instance_public_ip.0" {
  value = "${aws_instance.oreno_tf_ecs.0.public_ip}"
}

output "aws_instance_public_ip.1" {
  value = "${aws_instance.oreno_tf_ecs.1.public_ip}"
}

output "aws_elb_dns_name" {
  value = "${aws_elb.default-elb.dns_name}"
}
