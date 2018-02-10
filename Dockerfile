FROM python:3.6.3-alpine

MAINTAINER Andrew Carpenter <andrew@ethos.io> 

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache libstdc++ lapack-dev && \
    apk add --no-cache \
        --virtual=.build-dependencies \
        g++ gfortran musl-dev \
        python3-dev && \
    ln -s locale.h /usr/include/xlocale.h

RUN mkdir -p /opt/pandas/build/
COPY requirements.txt /opt/pandas/build/requirements.txt
RUN pip install -r /opt/pandas/build/requirements.txt
