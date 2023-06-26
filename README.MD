# About

This is a little project for interview for devops job in CDN77.

## Create infrastructure 
`ansible-playbook create_infrastructure.yml`

## Stop infrastructure

`ansible-playbook stop_infrastructure.yml`

## SQL commands for CockroachDB nodes
### node 1 

`cockroach sql --insecure --host=cdn77-cockroach-container-1:26257 \
--execute="SELECT count(*) FROM ycsb.public.usertable;"`

### node 2

`cockroach sql --insecure --host=cdn77-cockroach-container-2:26258 \
--execute="SELECT count(*) FROM ycsb.public.usertable;"`

`cockroach sql --insecure --host=cdn77-cockroach-container-1:26257 \
--execute="INSERT INTO ycsb.public.usertable VALUES ('asdf', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test');"`

### node 3

`cockroach sql --insecure --host=cdn77-cockroach-container-3:26259 \
--execute="SELECT count(*) FROM ycsb.public.usertable;"`

### node 4

`cockroach sql --insecure --host=cdn77-cockroach-container-4:26260 \
--execute="SELECT count(*) FROM ycsb.public.usertable;"`
