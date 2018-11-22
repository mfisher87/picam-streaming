# picam-streaming

Some scripts for streaming with Raspberry Pi camera module at reasonably low latency.

Intended for use with a fresh Raspian-Lite install. I am using several Pi Zero Ws and
streaming over WiFi with no hiccups.

## Install

Run install.sh to configure and start the service:

    source install.sh

Start and stop scripts exist as shortcuts to systmctl commands.

## Running

The service will be available via HTTP on port 8080. e.g.: `http://192.168.0.2:8080/`

You can add this feed to MotionEye or HomeAssistant or some other NVR utility as an MJPG camera.

## Credit

This is made possible by https://github.com/ccrisan/streameye. I haven't found a better way to
stream video from a Pi Zero with low latency, reasonable framerate and reasonable resolution.

I use MotionEye on a central server and stream video to MotionEye from multiple Pi Zero Ws.
