FROM mrupgrade/deadsnakes:3.6

# install git
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

ADD ./get-pip.py /
RUN python get-pip.py

# install python and venv
RUN apt-get update \
&& apt-get install -y software-properties-common curl \
&& add-apt-repository ppa:deadsnakes/ppa \
&& apt-get update \
&& apt-get install -y python3.6 python3.6-venv

RUN mkdir /home/sites

#Change directory and clone mysite Public POM repo
RUN mkdir /home/sites/production && \
     cd /home/sites/production && \
     git clone https://github.com/StevenGreenup/django_app.git

#Change directory and clone mysite Public POM repo
RUN mkdir /home/sites/staging && \
     cd /home/sites/staging && \
     git clone https://github.com/StevenGreenup/django_app.git

#Change directory and clone mysite Public POM repo
RUN mkdir /home/sites/test && \
     cd /home/sites/test && \
     git clone https://github.com/StevenGreenup/django_app.git