FROM python:3.9-slim-buster

RUN apt-get update && apt-get install -y libcairo2 python3-dev libffi-dev

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

# Install pip requirements
ADD requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /devel
COPY . /devel

# Switching to a non-root user, please refer to https://aka.ms/vscode-docker-python-user-rights
RUN useradd -m appuser && chown -R appuser /devel
USER appuser

CMD ["python", "manage.py", "runserver"]