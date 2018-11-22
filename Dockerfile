FROM python:3.6
ENV PYTHONUNBUFFERED 1
LABEL maintainer="mkyadav59@gmail.com"
LABEL version="1.0"
LABEL description="dockerfile For Django 2"

RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install virtualenv
RUN virtualenv env
RUN pip install mysqlclient
RUN pip install -r requirements.txt
ADD . /code/
