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

