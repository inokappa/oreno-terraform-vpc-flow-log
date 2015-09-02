# Create a new load balancer
resource "aws_elb" "default-elb" {
  name = "my-terraform-elb"
  # availability_zones = ["ap-northeast-1a", "ap-northeast-1c"]
  subnets = ["${var.subnet}"]
  security_groups = ["${aws_security_group.elb_allow_http.id}"]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "TCP:80"
    interval = 10
  }

  instances = [
    "${aws_instance.oreno_tf_ecs.0.id}",
    "${aws_instance.oreno_tf_ecs.1.id}"
  ]
  # cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "my-terraform-elb"
  }
}
