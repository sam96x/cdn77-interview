FROM debian:latest

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install wget tar -y

RUN wget https://github.com/prometheus/alertmanager/releases/download/v0.25.0/alertmanager-0.25.0.linux-amd64.tar.gz

RUN tar xzf alertmanager-0.25.0.linux-amd64.tar.gz && rm -rf alertmanager-0.25.0.linux-amd64.tar.gz

RUN mv -v alertmanager-0.25.0.linux-amd64 /opt/alertmanager

RUN mkdir -v /opt/alertmanager/data

CMD ["/bin/bash", "-c", "/opt/alertmanager/alertmanager --config.file=/opt/alertmanager/alertmanager.yml --storage.path=/opt/alertmanager/data"]