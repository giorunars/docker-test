FROM ubuntu:latest

#MAINTAINER Wei-Ming Wu <wnameless@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# Install sshd
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# Set password to 'admin'
RUN printf admin\\nadmin\\n | passwd

# Install Apache
RUN apt-get install -y apache2
# Install php
RUN apt-get install -y php5 libapache2-mod-php5 php5-mcrypt

VOLUME ["/docker-test"]

EXPOSE 80
EXPOSE 5432

CMD service apache2 start; \
	/usr/sbin/sshd -D