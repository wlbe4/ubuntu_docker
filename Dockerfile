FROM accetto/ubuntu-vnc-xfce-firefox-plus

ENV DEBIAN_FRONTEND noninteractive
USER root
RUN apt-get update && apt-get install -yy \
    build-essential  chrpath   cpio  debianutils  diffstat file gawk git iputils-ping \
    libdata-dumper-simple-perl liblz4-tool  libsdl1.2-dev  libthread-queue-any-perl \
    locales python3 socat subversion texinfo  vim  wget zstd \
    sudo libzstd-dev htop
RUN apt-get install -y gedit openssh-server
#RUN pip install Mapping
# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY ./setenv.sh /
COPY ./user_bashrc /user_bashrc
COPY ./docker_config /docker_config
RUN chmod +x /setenv.sh
# Configure SSH
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
#password for user login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22

#ENTRYPOINT ["/usr/bin/tini", "--"]
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--", "/setenv.sh"]
CMD ["NA", "NA", "NA"]
