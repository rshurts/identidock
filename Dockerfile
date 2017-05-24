FROM python:3.6.1

run groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.12.1 uWSGI==2.0.15 requests==2.14.2 redis==2.10.5
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
