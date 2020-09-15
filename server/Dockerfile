FROM python:3.8

COPY run.py /run.py
COPY templates /templates
COPY static /static
COPY Pipfile /Pipfile
COPY Pipfile.lock /Pipfile.lock

RUN pip install pipenv
RUN pipenv install --system --deploy

EXPOSE 5000
