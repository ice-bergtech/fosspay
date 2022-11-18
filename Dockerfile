FROM python:3-alpine

WORKDIR /fosspay

RUN apk update && \
	apk upgrade && \
	apk add postgresql-dev gcc make libc-dev

RUN python3 -m pip install --upgrade pip
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt

COPY . .

RUN make

EXPOSE 5000

ENTRYPOINT ["python3", "app.py"]
