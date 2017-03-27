FROM centos
MAINTAINER Raghu
RUN yum install httpd -y
RUN echo Hello World >/var/www/html/index.html
EXPOSE 80
CMD /usr/sbin/httpd -DFOREGROUND
