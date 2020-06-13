FROM python:3.8-slim-buster
MAINTAINER Joao Franca

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt  
RUN apt-get update && \
        apt-get install -y postgresql-client libpq-dev gcc
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser --disabled-login user
USER user
