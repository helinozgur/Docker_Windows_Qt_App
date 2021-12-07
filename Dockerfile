FROM python:3.8

ENV DISPLAY=host.docker.internal:0.0
ADD imshow.py .
ADD 2.png .
RUN apt-get update
RUN apt install -y libgl1-mesa-glx
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
CMD ["python","./imshow.py"]