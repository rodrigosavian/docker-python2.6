# Python
#
# VERSION               1.0

FROM pubdesign/server:latest
MAINTAINER Rodrigo Savian <rodrigosavian@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN apt-get update && apt-get upgrade -y
RUN add-apt-repository ppa:fkrull/deadsnakes -y
RUN apt-get update -y
RUN apt-get install python2.6 python2.6-dev -y

WORKDIR /tmp

RUN wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
RUN /usr/bin/python2.6 ez_setup.py
RUN /usr/local/bin/easy_install-2.6 pip

RUN ln -s /usr/bin/python2.6 /usr/local/bin/python

EXPOSE 8000

RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*