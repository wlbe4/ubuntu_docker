FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -yy \
    build-essential  chrpath   cpio  debianutils  diffstat file gawk git iputils-ping \
    libdata-dumper-simple-perl liblz4-tool  libsdl1.2-dev  libthread-queue-any-perl \
    locales python3 socat subversion texinfo  vim  wget zstd \
    sudo pip libzstd-dev
RUN pip install Mapping
# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY ./setenv.sh /
COPY ./user_bashrc /user_bashrc
RUN chmod +x /setenv.sh
ENTRYPOINT ["/setenv.sh"]
CMD ["NA", "NA", "NA"]
