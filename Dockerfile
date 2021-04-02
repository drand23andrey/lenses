FROM python:3.9.2-alpine
ENV PYTHONUNBUFFERED=1
WORKDIR /devel
COPY requirements.txt /devel/
RUN pip install -r requirements.txt
COPY . /devel/