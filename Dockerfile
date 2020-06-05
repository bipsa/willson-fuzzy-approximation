FROM ubuntu:latest

RUN apt-get update && apt-get -y update
RUN apt-get install -y build-essential python3.6 python3-pip python3-dev
RUN pip3 -q install pip --upgrade

COPY ./requirements /requirements
RUN pip3 install -r /requirements/development.txt

COPY ./compose/local/start /start
RUN sed -i 's/\r//' /start
RUN chmod +x /start

WORKDIR /app
