#
# Define task
#
resource "aws_ecs_task_definition" "nginx" {
  family = "nginx-task"
  container_definitions = <<EOF
[
  {
    "environment": [],
    "mountPoints": [],
    "name": "nginx",
    "image": "nginx",
    "cpu": 10,
    "memory": 128,
    "entryPoint": [],
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "command": [],
    "volumesFrom": [],
    "links": [],
    "essential": true
  }
]
EOF
}
