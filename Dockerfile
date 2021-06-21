FROM alpine:latest

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

COPY requirements.txt /src/requirements.txt
RUN pip3 install -r /src/requirements.txt
COPY app.py /src
COPY buzz /src/buzz
COPY yo_mama /src/yo_mama
EXPOSE 5000
CMD python /src/app.py