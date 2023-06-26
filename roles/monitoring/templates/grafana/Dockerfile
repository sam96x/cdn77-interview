FROM debian:latest

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install wget -y

RUN wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
RUN echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | tee -a /etc/apt/sources.list.d/grafana.list

RUN apt-get update -y

RUN apt-get install grafana -y
RUN apt-get install grafana-enterprise -y

EXPOSE 3000