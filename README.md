# picam-streaming

Some scripts for reliable streaming with Raspberry Pi camera module with low
latency, reasonable framerate, and reasonable resolution.

Streaming with cvlc was unreliable, slow to initialize in a viewer, and video
speed was not stable.

Intended for use with a fresh Raspian-Lite install. I am using several Pi Zero
Ws and streaming over WiFi with no hiccups.

## Install

Run install.sh to configure and start the service:

    source install.sh

Start and stop scripts exist as shortcuts to systmctl commands.

## Running

The service will be available via HTTP on port 8080. e.g.:
`http://192.168.0.2:8080/`

You can add this feed to MotionEye or HomeAssistant or some other NVR utility
as an MJPG camera.

## Credit

This is made possible by https://github.com/ccrisan/streameye. I haven't found
a better way to stream video from a Pi Zero which meets my latency, framerate,
and resolution minimum requirements.

## Tested on

I use MotionEye on a central server and stream video to MotionEye from multiple
Pi Zero Ws.

Finally, camera feeds are imported in to HomeAssistant as MJPEG cameras using
the "Streaming URL" from MotionEye. The following containers are running on the
server:

* https://hub.docker.com/r/ccrisan/motioneye/
* https://hub.docker.com/r/homeassistant/home-assistant/

I think you can up the framerate and resolution constants in `stream.sh`,
especially if you overclock your Pi (or have a more powerful Pi than a Zero
W). Be sure it doesn't overheat!
