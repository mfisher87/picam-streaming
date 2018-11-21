#!/bin/bash

port=8554
width=1640
height=922
fps=25
bitrate=1100000

case $1 in
    'http')
        proto_string="#standard{access=http,mux=ts,dst=:$port}"
        ;;
    'rtsp')
        proto_string="#rtp{sdp=rtsp://:$port/}"
        ;;
    *)
        echo "Valid options for 1st positional arg are 'http' and 'rtsp'."
        exit 1
        ;;
esac

if [ -z "$2" ]; then
    echo "Must provide a 'camera name' for 2nd positional arg."
    exit 1
fi

raspivid -o - -t 0 -w $width -h $height -fps $fps -b $bitrate -a 1024 -a 8 -a "$2 %Y-%m-%d %X" | cvlc -v stream:///dev/stdin --sout "$proto_string" :demux=h264
