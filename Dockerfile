FROM python:3.8-slim

RUN python --version && \
    apt-get update -y && \
    apt-get install build-essential pipenv -y

WORKDIR /code

COPY . .

RUN make env-dev

ENTRYPOINT ["python", "main.py"]
