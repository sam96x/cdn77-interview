FROM debian:latest

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install curl tar -y

RUN curl https://binaries.cockroachdb.com/cockroach-v23.1.3.linux-amd64.tgz | tar -xz

RUN cp -i cockroach-v23.1.3.linux-amd64/cockroach /usr/local/bin/