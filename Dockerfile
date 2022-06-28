FROM python:3.10

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app
COPY ./.env /code/.env


EXPOSE 80:80

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", $PORT, "wsgi"]