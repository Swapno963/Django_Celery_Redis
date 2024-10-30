FROM python:3.14.0a1-alpine3.20

WORKDIR /usr/src/app

# Prevent python from wrting .pyc files
ENV PYTHONDONTWRITEBYTECODE 1

# Ensure python output is send directly to the terminal without buffering
ENV PYTHONUNBUFFERED 1



RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt

COPY ./entrypoint.sh /usr/src/app/



COPY . /usr/src/app/


ENTRYPOINT [ "/usr/src/app/entrypoint.sh" ]

