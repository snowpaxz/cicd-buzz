FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" > /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories
RUN apk --no-cache --update-cache add gcc gfortran python python-dev py-pip \
    build-base wget freetype-dev libpng-dev openblas-dev

RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN pip install numpy scipy pandas matplotlib pytest Flask



COPY app.py /src
COPY buzz /src/buzz
COPY yo_mama /src/yo_mama
EXPOSE 5000
CMD python /src/app.py