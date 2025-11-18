#!/bin/sh

IMAGE_URL="$1"
IMAGE_FILE="image.jpg"

wget -O "$IMAGE_FILE" "$IMAGE_URL"

if [ ! -f "$IMAGE_FILE" ]; then
    echo "Failed to download Image"
    exit 1
fi

./darknet detector test cfg/coco.data cfg/yolov3.cfg yolov3.weights "$IMAGE_FILE"