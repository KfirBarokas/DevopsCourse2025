FROM python:3.13.5-alpine3.22

RUN apk update && apk add git
RUN git clone https://github.com/pallets/flask

WORKDIR flask

# Get latest tag
RUN latesttag=$(git describe --tags)
RUN git checkout ${latesttag}
WORKDIR examples/tutorial

RUN pip install -e .

ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_APP=flaskr
ENV FLASK_ENV=development

RUN flask init-db
EXPOSE 5000
CMD ["flask", "run"]
