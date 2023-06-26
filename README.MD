# About

This is a little project for interview for devops job in CDN77.

## Ansible commands
### Create infrastructure 
`ansible-playbook create_infrastructure.yml`

### Stop infrastructure

`ansible-playbook stop_infrastructure.yml`

### Delete Docker images

`ansible-playbook delete_images.yml`

### Delete Docker volumes

`ansible-playbook delete_volumes.yml`
## SQL commands for CockroachDB nodes

Based on: https://www.cockroachlabs.com/docs/stable/demo-fault-tolerance-and-recovery.html

### node 1 

`cockroach sql --insecure --host=cdn77-cockroach-container-1:26257 \
--execute="SELECT count(*) FROM ycsb.public.usertable;"`

`cockroach sql --insecure --host=cdn77-cockroach-container-1:26257 \
--execute="INSERT INTO ycsb.public.usertable VALUES ('asdf', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test');"`

### node 2

`cockroach sql --insecure --host=cdn77-cockroach-container-2:26258 \
--execute="SELECT count(*) FROM ycsb.public.usertable;"`

### node 3

`cockroach sql --insecure --host=cdn77-cockroach-container-3:26259 \
--execute="SELECT count(*) FROM ycsb.public.usertable;"`

### node 4

`cockroach sql --insecure --host=cdn77-cockroach-container-4:26260 \
--execute="SELECT count(*) FROM ycsb.public.usertable;"`
