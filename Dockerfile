FROM python:3.6

ENV PYTHONUNBUFFERED 1
LABEL maintainer="mkyadav59@gmail.com"
LABEL version="1.0"
LABEL description="dockerfile For Django 2"

# Install required packages and remove the apt packages cache when done.
RUN apt-get update && \
    apt-get upgrade -y && \ 	
    apt-get install -y \
	git \
	python3 \
	python3-dev \
	python3-setuptools \
	python3-pip \
	nginx \
	supervisor \
	sqlite3 && \
	pip3 install -U pip setuptools && \
   rm -rf /var/lib/apt/lists/*

WORKDIR /app

ADD requirements.txt /app/
RUN pip install virtualenv
RUN virtualenv env
RUN pip install mysqlclient
RUN pip install -r requirements.txt
RUN django-admin.py startproject djangoProject .
RUN django-admin.py startapp djangoApp
RUN python manage.py migrate 

EXPOSE 8001

CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]

