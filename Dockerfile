FROM python:3

COPY hello-world.py /
COPY requirements.txt /

RUN pip install -r requirements.txt

CMD [ "python", "-u", "hello-world.py" ]