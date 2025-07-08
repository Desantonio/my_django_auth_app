FROM python:3.10

WORKDIR /code

COPY requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /code/

EXPOSE 8000

ENTRYPOINT ["./entrypoint.sh"]
