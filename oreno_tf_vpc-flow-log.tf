#
# Create VPC flow log
#
resource "aws_flow_log" "my_vpc_flow_log" {
  #
  # aws logs create-log-group --log-group-name cw-log-group-name
  #
  log_group_name = "${var.cw-log-group-name}"
  iam_role_arn = "${aws_iam_role.vpc_flow_log_role.arn}"
  # vpc_id = "${var.vpc-id}"
  subnet_id = "${var.subnet}"
  traffic_type = "ALL"
}
