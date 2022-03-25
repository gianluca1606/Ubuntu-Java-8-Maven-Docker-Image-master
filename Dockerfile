FROM rightmesh/ubuntu-openjdk:18.04

MAINTAINER Gianluca Santos Latina <gianluca.santoslatina@gmail.com> (@gianluca1606)

ARG MAVEN_VERSION="3.6.3"
ARG USER_HOME_DIR="/root"
ARG SHA="b98a1905eb554d07427b2e5509ff09bd53e2f1dd7a0afa38384968b113abef02"
ARG BASE_URL="https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries"

RUN apt-get update && apt-get install -y \
curl
RUN mkdir -p /usr/share/maven \
    && curl -Lso  /tmp/maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && echo " /tmp/maven.tar.gz"  \
    && tar -xzC /usr/share/maven --strip-components=1 -f /tmp/maven.tar.gz \
    && rm -v /tmp/maven.tar.gz \
    && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "${USER_HOME_DIR}/.m2"

