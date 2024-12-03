FROM python:latest

WORKDIR /usr/src/app

COPY src /usr/src/app/src
COPY Makefile requirements.txt requirements-tests.txt setup.cfg /usr/src/app/

RUN make venv
# RUN timedatectl set-timezone Europe/Madrid
RUN cat /etc/timezone

CMD ["make", "run"]