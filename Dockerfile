FROM python:3.5.1

LABEL maintainer "achya_syahputra@outlook.com"

WORKDIR ~/my_flask_app

COPY . ~/my_flask_app

RUN pip install flask gunicorn
    
EXPOSE 8000

CMD ["gunicorn", "-b", "0.0.0.0:8000", "hello"]



