FROM debian:latest

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install wget curl gzip tar -y

RUN mkdir /etc/prometheus && mkdir /var/lib/prometheus

RUN wget https://github.com/prometheus/prometheus/releases/download/v2.44.0/prometheus-2.44.0.linux-amd64.tar.gz
RUN tar -xvf prometheus-2.44.0.linux-amd64.tar.gz
RUN mv prometheus-2.44.0.linux-amd64 prometheus && rm -rf prometheus-2.44.0.linux-amd64.tar.gz
RUN mv prometheus /etc/

RUN mkdir prometheus

RUN mv /etc/prometheus/prometheus /usr/local/bin/prometheus
 
RUN mv /etc/prometheus/promtool /usr/local/bin/promtool

EXPOSE 9090

CMD ["prometheus", "--config.file=/etc/prometheus/prometheus.yml"]