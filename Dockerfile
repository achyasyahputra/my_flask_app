FROM python:3.5.1

LABEL maintainer "achya_syahputra@outlook.com"

RUN pip install -U pip \ 
    pip install -r requirements.txt

COPY . .

WORKDIR ~/my_flask_app

EXPOSE 8000

CMD gunicorn hello:app



