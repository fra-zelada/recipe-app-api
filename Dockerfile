FROM python:3.9-alpine3.13
LABEL maintainer="fzelada.site"

# Cambiar el usuario de instalación de paquetes APK a root
USER root

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client jpeg-dev && \
    apk add --update --no-cache --virtual .tmp-build-deps \
    build-base postgresql-dev musl-dev zlib zlib-dev && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; then /py/bin/pip install -r /tmp/requirements.dev.txt; fi && \
    rm -rf /tmp && \
    apk del .tmp-build-deps && \
    if [ $DEV = "true" ]; then \
    adduser -D -u 1000 django-user; \
    else \
    adduser -D -G root django-user; \
    fi && \
    mkdir -p /vol/web/media && \
    mkdir -p /vol/web/static && \
    chown -R django-user:django-user /vol && \
    chmod -R 755 /vol

ENV PATH="/py/bin:$PATH"

# Cambiar el propietario y permisos de la carpeta /app
RUN chown -R django-user:django-user /app

# Set the default user and group
USER django-user:django-user

# Now, commands executed inside the container will use the "django-user" user and group

