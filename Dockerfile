FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ssh \
    sudo \
    git \
    wget \
    ca-certificates \
    rsync \
    strace \
    build-essential

# Add python installation
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get install -y python3.6
###################################################################

COPY ./setenv.sh /
RUN chmod +x /setenv.sh
ENTRYPOINT ["/setenv.sh"]
CMD ["NA", "NA", "NA"]

