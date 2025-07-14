FROM python:3.13.5-alpine3.22

RUN apk update && apk add git

RUN git clone https://github.com/KfirBarokas/DevopsCourse2025
WORKDIR DevopsCourse2025

RUN git checkout feature/sol

RUN cp -r . /usr/src/app

WORKDIR /usr/src/app

RUN pip install -e .

ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_APP=flaskr
ENV FLASK_ENV=development

RUN flask init-db
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]
