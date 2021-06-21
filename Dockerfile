FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" > /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories
RUN apk --update-cache add gcc gfortran python3 python3-dev jpeg-dev py3-pip py3-wheel
RUN apk --update-cache add build-base wget freetype-dev libpng-dev openblas-dev mencoder

COPY requirements.txt /src/requirements.txt
RUN pip3 install -r /src/requirements.txt

COPY app.py /src
COPY buzz /src/buzz
COPY yo_mama /src/yo_mama
COPY animatebasic /src/animatebasic
EXPOSE 5000
CMD python3 /src/app.py