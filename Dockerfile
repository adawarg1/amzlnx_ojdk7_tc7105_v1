# Install FROM AMAZON LINUX 2
FROM amazonlinux:latest

#Author of the Docker File
LABEL "Maintainer"="adawar"

# RUN COMMAND BASICALLY runs the command in the terminal and creates an image.
RUN yum update -y


RUN yum install -y vim
RUN yum install -y curl
RUN yum install -y wget
RUN yum install -y tar


#RUN apt-get install -y mysql-client

ENV TOMCAT_VERSION 7.0.105

#RUN yum update && yum install -y java-1.7.0-openjdk maven
RUN yum install -y java-1.7.0-openjdk maven

#RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz -O /tmp/tomcat.tar.gz
RUN wget --quiet --no-cookies http://apache.rediris.es/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz
RUN cd /tmp && tar xvzf tomcat.tar.gz

RUN mkdir /usr/local/tomcat
RUN cp -R /tmp/apache-tomcat-7.0.105/* /usr/local/tomcat/

EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run

