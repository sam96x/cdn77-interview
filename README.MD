# About

This is a little project for interview for devops job in CDN77.

Documents: 
* [devops_task.pdf](documents/devops_task.pdf) - Devops task
* [task_solution.pdf](documents/task_solution.pdf) - Task solution

## Create infrastructure 
`ansible-playbook --ask-become-pass install_docker.yml nginx.yml kafka.yml prometheus.yml`

## Delete infrastructure

`./stop_containers.sh`