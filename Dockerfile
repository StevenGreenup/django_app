FROM ubuntu:xenial

MAINTAINER sgreenup

# install git
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

ADD ./get-pip.py /

#Change directory and clone Qxf2 Public POM repo
RUN mkdir /usr/my_site \
    && cd /usr/my_site \
    && git clone https://github.com/qxf2/qxf2-page-object-model.git

RUN apt-get purge -y python.* && \
    echo "deb http://ppa.launchpad.net/fkrull/deadsnakes/ubuntu xenial main" >> /etc/apt/sources.list && \
    echo "deb-src http://ppa.launchpad.net/fkrull/deadsnakes/ubuntu xenial main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FF3997E83CD969B409FB24BC5BB92C09DB82666C && \
    apt-get update && \
    apt-get install -y python__PY_VER__ && \
    python__PY_VER__ /get-pip.py && \
    pip install --upgrade pip && \
    ln -s /usr/bin/python__PY_VER__ /usr/bin/python && \
    rm -f /get-pip.py && \
    rm -rf /var/lib/apt/lists/*

CMD ["python"]