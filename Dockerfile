# Python
#
# VERSION               1.0

FROM pubdesign/server:latest
MAINTAINER Rodrigo Savian <rodrigosavian@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN apt-get update && apt-get upgrade -y
# RUN apt-get install -y libjpeg-dev zlib1g-dev libfreetype6-dev liblcms1 liblcms1-dev liblcms-utils tk-dev libbz2-dev libssl-dev libncursesw5-dev libncurses5-dev libsqlite3-dev libc6-dev sqlite3 libpcap-dev libreadline-dev libgdbm-dev liblzma-dev

RUN add-apt-repository ppa:fkrull/deadsnakes -y
RUN apt-get update -y
RUN apt-get install python2.6 python2.6-dev -y

WORKDIR /tmp

RUN wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
RUN /usr/bin/python2.6 ez_setup.py
RUN /usr/local/bin/easy_install-2.6 pip

RUN ln -s /usr/bin/python2.6 /usr/local/bin/python

RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*