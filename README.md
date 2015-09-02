## oreno-terraform-vpc_flow_log

### required

- AWS access key
- AWS secret access key
- SSH key(for Container Instance)
- SSH Allow IP(for Container Instance)
- VPC ID
- VPC Subnet ID
- CloudWatch Logs log group name(for VPC Flow Logs)
- Datadog API Key(for Datadog Agent)

Please create CloudWatch Logs log group name.

```sh
$ aws logs create-log-group --log-group-name my-flow-log
```

### checked version

```sh
$ terraform version
Terraform v0.6.3
```

### terraform apply after...

- Run ECS Instance(t2.micro)
- Run ECS Agent Task
- Run Datadog Agent Task via ECS Service
- Run Nginx Task via ECS Service
- Run Aggregation VPC flow log

### terraform plan

```
terraform plan \
-var 'access_key=AK123456789123456789' \
-var 'secret_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' \
-var 'ssh_key_name=your_ssh_key_name' \
-var 'ssh_allow_ip=xxx.xxx.xxx.xxx/32 ' \
-var 'vpc-id=vpc-xxxxxxx' \
-var 'subnet=subnet-xxxxxxx' \
-var 'cw-log-group-name=my-flow-log ' \
-var 'datadog_api_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
```

### terraform apply

```
terraform apply \
-var 'access_key=AK123456789123456789' \
-var 'secret_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' \
-var 'ssh_key_name=your_ssh_key_name' \
-var 'ssh_allow_ip=xxx.xxx.xxx.xxx/32 ' \
-var 'vpc-id=vpc-xxxxxxx' \
-var 'subnet=subnet-xxxxxxx' \
-var 'cw-log-group-name=my-flow-log ' \
-var 'datadog_api_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
```

### terraform destroy

```
terraform destroy \
-var 'access_key=AK123456789123456789' \
-var 'secret_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' \
-var 'ssh_key_name=your_ssh_key_name' \
-var 'ssh_allow_ip=xxx.xxx.xxx.xxx/32 ' \
-var 'vpc-id=vpc-xxxxxxx' \
-var 'subnet=subnet-xxxxxxx' \
-var 'cw-log-group-name=my-flow-log ' \
-var 'datadog_api_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
```
