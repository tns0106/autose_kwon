FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    git \
    wget \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pjreddie/darknet && \
    cd /darknet && \
    make && \
    wget https://data.pjreddie.com/files/yolov3.weights

WORKDIR /darknet

COPY image.sh .

RUN chmod +x ./image.sh

ENTRYPOINT ["./image.sh"]