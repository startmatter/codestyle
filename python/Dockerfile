ARG PYTHON_VERSION=3

FROM python:$PYTHON_VERSION

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY flake8 /root/.config/flake8

RUN mkdir /code

WORKDIR /code

CMD ["flake8", "."]
