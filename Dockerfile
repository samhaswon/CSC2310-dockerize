# syntax=docker/dockerfile:1
FROM docker.io/mongo
COPY ./datalayer/Artists.json /tmp/Artists.json
COPY ./importdb.sh /app/importdb.sh
RUN apt-get update && apt-get install --no-install-recommends --yes python3 python3-pip
RUN pip install --upgrade pip
COPY requirements.txt /tmp/requirements.txt
WORKDIR /tmp
RUN pip install -r requirements.txt
WORKDIR /app
COPY . .
EXPOSE 5000

ENTRYPOINT ["/app/importdb.sh"]
