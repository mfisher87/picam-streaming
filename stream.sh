#!/bin/bash

width=640
height=480
fps=10

~/streameye/extras/raspimjpeg.py -w $width -h $height -r $fps | streameye
