#!/bin/sh
#==================================================================================
#      AUTHOR:	D.A. Boni (djboni@gmail.com)
#     VERSION:	1.0.0
#     LICENSE:	Creative Commons Attribution 4.0 International License (CC-BY)
#     CREATED:	2017.08.12 19:24:34 +8
#    REVISION:	2017.08.30 12:10:25 +8
#==================================================================================
set -xe

sudo apt update

case $(lsb_release -sc) in
bionic)
  echo "Ubuntu 18.04 (bionic)"
  sudo apt install -y git cmake gcc g++ build-essential ffmpeg \
                      abcmidi abcm2ps inkscape timidity lame   \
                      libx11-dev      \
                      xorg-dev        \
                      libgtk-3-dev    \
                      libavcodec-dev  \
                      libavformat-dev \
                      libavdevice-dev \
                      libavutil-dev   \
                      libswscale-dev  \
                      libpostproc-dev \
                      libasound2-dev
  ;;
focal)
  echo "Ubuntu 20.04 (focal)"
  sudo apt install -y git cmake gcc g++ build-essential ffmpeg \
                      abcmidi abcm2ps inkscape timidity lame   \
                      libx11-dev      \
                      xorg-dev        \
                      libgtk-3-dev    \
                      libavcodec-dev  \
                      libavformat-dev \
                      libavdevice-dev \
                      libavutil-dev   \
                      libswscale-dev  \
                      libpostproc-dev \
                      libasound2-dev
  ;;
*)
  echo "UNKNOWN lsb_release: $(lsb_release -sc)"
  exit 1
  ;;
esac

# Git Clone MIDIVisualizer
[ ! -d MIDIVisualizer-src ] &&
git clone https://github.com/kosua20/MIDIVisualizer MIDIVisualizer-src

# Create build directory and change directory
mkdir -p MIDIVisualizer-src/build
cd MIDIVisualizer-src/build

# Build
case $(lsb_release -sc) in
bionic)
  cmake .. -Wno-dev
  ;;
focal)
  cmake .. -Wno-dev
  ;;
*)
  cmake .. -Wno-dev
  ;;
esac

make

# Go back to the original directory and copy the new executable
cd -
rm -f MIDIVisualizer
cp MIDIVisualizer-src/build/MIDIVisualizer .

# Try to convert
mkdir -p mp4
./MIDIVisualizer --size 1280 720 --export ./mp4/test.mp4 --format MPEG4
