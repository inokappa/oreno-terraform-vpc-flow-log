#
# Create IAM Instance Profile for ECS Instance
#
resource "aws_iam_instance_profile" "ecs_iam_role" {
    name = "ecs_iam_role"
    roles = ["${aws_iam_role.ecs_iam_role.name}"]
}

#
# Create IAM role
#
resource "aws_iam_role" "ecs_iam_role" {
    name = "ecs_iam_role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# 
# Create IAM role Policy for ECS Instance
#
resource "aws_iam_role_policy" "ecs_iam_role" {
    name = "ecs_iam_role"
    role = "${aws_iam_role.ecs_iam_role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
         "ecs:RegisterContainerInstance",
         "ecs:DeregisterContainerInstance",
         "ecs:DiscoverPollEndpoint",
         "ecs:Submit*",
         "ecs:Poll",
         "ecs:StartTask",
         "ecs:StartTelemetrySession"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

#
# Create IAM role for VPC flow log
#
resource "aws_iam_role" "vpc_flow_log_role" {
    name = "vpc-flow-log-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
} 
EOF
}

#
# Create IAM role Policy for VPC flow log
#
resource "aws_iam_role_policy" "vpc_flow_log_policy" {
    name = "vpc-flow-log-policy"
    role = "${aws_iam_role.vpc_flow_log_role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}   
EOF
}
