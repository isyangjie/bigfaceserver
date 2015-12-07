############################################################
# Dockerfile to build lighttpd and Web.py Installed Containers
# Based on Ubuntu
############################################################
# Set the base image to Ubuntu
FROM ubuntu
# File Author / Maintainer
MAINTAINER JIE YANG
# Install Nginx
# Add application repository URL to the default sources
#RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list
# Update the repository
#RUN apt-get update
# Install necessary tools
RUN apt-get install -y nano wget
# Install esay_install
RUN apt-get install -y python-setuptools
# Install Web.py
RUN easy_install web.py
# Download and Install lighttpd
#RUN apt-get install -y lighttpd
# Remove the default Nginx configuration file
#RUN rm -v /etc/lighttpd/lighttpd.conf
# Copy a configuration file from the current directory
#ADD lighttpd.conf /etc/lighttpd/
# Append "daemon off;" to the beginning of the configuration
#RUN echo "daemon off;" >> /etc/lighttpd/lighttpd.conf
#Add code to /usr/bigface
RUN mkdir /usr/bigface
ADD static /usr/bigface
ADD templates /usr/bigface
ADD ConfigManager.py /usr/bigface
ADD index.py /usr/bigface
ADD login.conf /usr/bigface
# Expose ports
EXPOSE 80
# Set the default command to execute
# when creating a new container
CMD nohup python /usr/bigface/index.py 80 &
