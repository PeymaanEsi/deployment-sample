FROM python:alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt /tmp
RUN pip install --upgrade pip
RUN python -m pip install -r /tmp/requirements.txt
RUN rm /tmp/requirements.txt

EXPOSE 8000

COPY ./project /app

RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

CMD ["./manage.py", "runserver", "0.0.0.0:8000"]

