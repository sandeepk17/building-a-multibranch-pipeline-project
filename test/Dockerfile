FROM centos:centos7

ARG JAVA_VERSION=12.0.1
ARG JAVA_BUILD=12

# update dpkg repositories
RUN yum update -y

# install wget
RUN yum install -y wget git nano

# get maven 3.3.9
RUN wget --no-verbose -O /tmp/apache-maven-3.3.9.tar.gz http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz

# verify checksum
RUN echo "516923b3955b6035ba6b0a5b031fbd8b /tmp/apache-maven-3.3.9.tar.gz" | md5sum -c

# install maven
RUN tar xzf /tmp/apache-maven-3.3.9.tar.gz -C /opt/ && \
    ln -s /opt/apache-maven-3.3.9 /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin && \
    rm -f /tmp/apache-maven-3.3.9.tar.gz
ENV MAVEN_HOME /opt/maven

# remove download archive files
RUN yum clean all

# Install java
RUN curl -sOL https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-${JAVA_VERSION}%2B${JAVA_BUILD}/OpenJDK12U-jdk_x64_linux_hotspot_${JAVA_VERSION}_${JAVA_BUILD}.tar.gz && \
	mkdir /usr/share/java && \
	tar zxf OpenJDK12U-jdk_x64_linux_hotspot_${JAVA_VERSION}_${JAVA_BUILD}.tar.gz -C /usr/share/java && \
	rm -rf OpenJDK12U-jdk_x64_linux_hotspot_${JAVA_VERSION}_${JAVA_BUILD}.tar.gz

# Set Java home
ENV JAVA_HOME /usr/share/java/jdk-${JAVA_VERSION}+${JAVA_BUILD}
ENV PATH $PATH:$JAVA_HOME/bin

CMD ["/bin/bash"]