FROM python:3.12.4-bookworm

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


RUN mkdir -p /home/app

ENV HOME=/home/app
ENV APP_HOME=/home/app/web
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY ./requirements.txt $APP_HOME
RUN pip install -r requirements.txt
COPY . $APP_HOME

RUN apt-get update && apt-get install -y --no-install-recommends netcat-traditional

RUN pip install --upgrade pip

RUN chmod +x  $APP_HOME/entrypoint.prod.sh
ENTRYPOINT ["/home/app/web/entrypoint.prod.sh"]

RUN chmod +x $APP_HOME

ENTRYPOINT ["./entrypoint.prod.sh"]
dos2unix entrypoint.prod.sh


ENV PORT=8000
CMD ["gunicorn","mainapp.wsgi:application"]
EXPOSE 8000