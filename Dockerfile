FROM centos:latest
RUN yum update -y && yum install httpd -y
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80