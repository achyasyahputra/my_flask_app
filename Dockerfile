FROM python:3.5.1

LABEL maintainer "achya_syahputra@outlook.com"

WORKDIR ~/my_flask_app

COPY . .

RUN pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 8000

CMD gunicorn hello:app



