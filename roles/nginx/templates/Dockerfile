FROM debian:latest

ARG USERNAME=nginx

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install nginx curl wget -y 

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]