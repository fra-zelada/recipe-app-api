# recipe-app-api
Recipe api project  - DRF course

## run the project

``` docker-compose up ```

## construir imagen

``` docker build . ```

or

``` docker-compose build ```


## correr linter

``` docker-compose run --rm app sh -c "flake8" ```

## crear el proyecto

``` docker-compose run --rm app sh -c "django-admin startproject app ." ```

## ejecutar tests

``` docker-compose run --rm app sh -c "python manage.py test" ```

## ejecutar tests de comando creado

``` docker-compose run --rm app sh -c "python manage.py wait_for_db" ```

## ejecutar tests de comando creado y linting

``` docker-compose run --rm app sh -c "python manage.py wait_for_db && flake8" ```

## crear una app en el proyecto

``` docker-compose run --rm app sh -c "python manage.py startapp core" ```

## makemigrations

``` docker-compose run --rm app sh -c "python manage.py makemigrations" ```

## migrate

``` docker-compose run --rm app sh -c "python manage.py wait_for_db && python manage.py migrate" ```

## remove volume

``` docker volume rm recipe-app-api_dev-db-data ```

## create super user

``` docker-compose run --rm app sh -c "python manage.py createsuperuser" ```

## create venv

``` python -m virtualenv -p C:\Users\Panch\AppData\Local\Programs\Python\Python39\python.exe venv ```

## activar venv

``` .\venv\Scripts\activate ```

## install requirements

``` pip install -r requirements.txt -r requirements.dev.txt ```