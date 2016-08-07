FROM ubuntu:16.04
MAINTAINER Yamin Noor <ymnoor21@gmail.com>
ENV DEBIAN_FRONTEND=noninteractive

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

# install necessary python softwares
RUN apt-get -y update
RUN apt-get -y install apache2 python3-pip libapache2-mod-wsgi-py3 vim

# enable apache rewrite module
RUN a2enmod rewrite

# pip upgrade
RUN pip3 install --upgrade pip

# install virtual environment
RUN pip3 install virtualenv

# make project directory & setup permission
RUN mkdir /var/www/site
RUN chmod -R 775 /var/www/site

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2ensite 000-default.conf

# start apache2 server
RUN service apache2 start

# Expose port 80
EXPOSE 80

# Run these commands when setting up the project for the first time
	# docker build -t ymnoor21/ap-mod-wsgi:v1 -f Dockerfile .

	# docker create -v ~/Docker_boxes/django-1.10/site:/var/www/site --name django_data ubuntu:16.04 /bin/true

	# docker run -d -it --name ap-mod-wsgi --volumes-from django_data -p 8000:80 ymnoor21/ap-mod-wsgi:v1 /bin/bash

	# docker exec -it ap-mod-wsgi /bin/bash

	# cd /var/www/site
	
	# virtualenv venv

	# source venv/bin/activate
	
	# pip3 install django
	
	# django-admin.py startproject myproject .

	# pip3 freeze > requirements.txt
	
	# add this following line to the end of this (myproject/settings.py) file:
		# STATIC_ROOT = os.path.join(BASE_DIR, 'static/')
	
	# ./manage.py makemigrations

	# ./manage.py migrate
	
	# ./manage.py createsuperuser
	
	# ./manage.py collectstatic

	# deactivate

	# chown -R :www-data /var/www/site

	# chmod -R 775 /var/www/site