FROM python:3.8

COPY main.py /main.py
COPY Pipfile /Pipfile
COPY Pipfile.lock /Pipfile.lock

RUN apt-get update && apt-get install -y unzip

#install google-chrome, rsvg-convert, vim
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add && \
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable
RUN apt-get install -y vim

#install ChromeDriver
ADD https://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_linux64.zip /opt/chrome/
RUN cd /opt/chrome/ && \
    unzip chromedriver_linux64.zip

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/chrome

RUN pip install pipenv
RUN pipenv install --system --deploy
