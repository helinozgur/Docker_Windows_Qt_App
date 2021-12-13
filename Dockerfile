FROM python:3.8
ENV QT_QPA_PLATFORM=xcb
ENV QT_QPA_PLATFORM_PLUGIN_PATH=/opt/Qt/${QT_VERSION}/gcc_64/plugins
ENV QT_PLUGIN_PATH=/opt/Qt/${QT_VERSION}/gcc_64/plugins
ENV DISPLAY=host.docker.internal:0.0
RUN apt-get update
RUN apt-get install -y libdbus-glib-1-dev
RUN apt-get install -y libxkbcommon-x11-0
RUN apt install -y libgl1-mesa-glx
RUN apt-get install -y libxcb-xinerama0
RUN apt-get install -y -qq libglu1-mesa-dev libx11-xcb-dev '^libxcb*'

COPY app/requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app
COPY run.sh /app/run.sh
RUN chmod a+x run.sh
CMD ["./run.sh"]
