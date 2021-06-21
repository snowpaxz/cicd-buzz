FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" > /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 python-dev gfortran py3-pip build-base py3-numpy@community && \
    ln -sf python3 /usr/bin/python && \
    python3 -m ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools


RUN python3 -m venv /opt/venv

COPY requirements.txt /src/requirements.txt
RUN pip3 install -r /src/requirements.txt

COPY app.py /src
COPY buzz /src/buzz
COPY yo_mama /src/yo_mama
EXPOSE 5000
CMD python /src/app.py