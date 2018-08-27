#!/bin/bash
. stream-constants.sh

raspivid -o - -t 0 -w $width -h $height -fps $fps -b $bitrate -a 1024 -a 8 -a "ABC %Y-%m-%d %X" | cvlc -v stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:8554}' :demux=h264
