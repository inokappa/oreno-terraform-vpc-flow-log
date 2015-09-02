#
# Define task
#
resource "aws_ecs_task_definition" "datadog_agent" {
  family = "dd-agent-task"
  volume {
    name = "docker_sock"
    host_path = "/var/run/docker.sock"
  }
  volume {
    name = "proc_mounts"
    host_path = "/proc/mounts"
  }
  volume {
    name = "cgroup"
    host_path = "/cgroup/"
  }
  container_definitions = <<EOF
[
  {
    "environment": [
        {
            "name": "API_KEY",
            "value": "${var.datadog_api_key}"
        },
        {
          "name": "TAGS",
          "value": "simple-tag-0, tag-key-1:tag-value-1"
        }
    ],
    "mountPoints": [
        {
            "sourceVolume": "docker_sock",
            "containerPath": "/var/run/docker.sock",
            "readOnly": false
        },
        {
            "sourceVolume": "proc_mounts",
            "containerPath": "/host/proc/mounts",
            "readOnly": true
        },
        {
            "sourceVolume": "cgroup",
            "containerPath": "/host/sys/fs/cgroup",
            "readOnly": true
        }
    ],
    "name": "dd-agent",
    "image": "datadog/docker-dd-agent:ecs",
    "cpu": 10,
    "memory": 128,
    "entryPoint": [],
    "portMappings": [],
    "command": [],
    "volumesFrom": [],
    "links": [],
    "essential": true
  }
]
EOF
}
