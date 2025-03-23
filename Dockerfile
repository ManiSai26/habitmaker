FROM python:3.12.4-bookworm

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN mkdir -p /home/app

ENV HOME=/home/app
ENV APP_HOME=/home/app/web
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
RUN pip install --upgrade pip
RUN apt-get update && apt-get install -y --no-install-recommends netcat-traditional dos2unix
COPY ./requirements.txt $APP_HOME
RUN pip install -r requirements.txt

COPY . $APP_HOME

RUN chmod +x $APP_HOME
COPY ./entrypoint.prod.sh /entrypoint.prod.sh
RUN dos2unix entrypoint.prod.sh
RUN chmod +x /entrypoint.prod.sh
EXPOSE 8000
ENV PORT=8000
ENTRYPOINT ["./entrypoint.prod.sh"]
# CMD ["gunicorn","mainapp.wsgi:application"]