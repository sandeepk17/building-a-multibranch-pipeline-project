FROM indigo/centos-maven

RUN yum install https://adoptopenjdk.jfrog.io/adoptopenjdk/rpm/centos/7/x86_64/Packages/adoptopenjdk-12-openj9-12.0.1+12-1.x86_64.rpm -y
# Install Git
RUN yum install -y wget git which
ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"
RUN echo $JAVA_HOME
# Set Timezone
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV PATH="/usr/lib/oracle/19.3/client64/bin:${PATH}"

# Run the specified command within the container.
CMD ["/bin/bash"]