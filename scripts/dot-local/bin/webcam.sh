#!/bin/sh

ffplay \
    -f v4l2 \
    -video_size 1920x1080 \
    -input_format mjpeg \
    -i /dev/video0 \
    -fflags nobuffer \
    -flags low_delay
