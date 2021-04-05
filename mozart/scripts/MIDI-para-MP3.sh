#!/bin/sh
#==================================================================================
#      AUTHOR:	D.A. Boni (djboni@gmail.com)
#     VERSION:	1.0.0
#     LICENSE:	Creative Commons Attribution 4.0 International License (CC-BY)
#     CREATED:	2017.08.12 19:24:34 +8
#    REVISION:	2017.08.30 12:10:25 +8
#==================================================================================

# Usage: ./MIDI-para-MP3.sh INPUT.mid OUTPUT.mp3

usage(){
  echo "Usage: ./MIDI-para-MP3.sh INPUT.mid OUTPUT.mp3"
}

if [ $# -ne 2 ]; then
  usage
  exit 1
else
  INPUT="$1"
  OUTPUT="$2"

  echo "Creating MP3 from MIDI: $INPUT -> $OUTPUT"
fi

# Cria MP3
timidity "$INPUT" -Ow -o - | lame - -b 64 "$OUTPUT"
#timidity "$INPUT" -Ow -o - | ffmpeg -i - -acodec libmp3lame -ab 64k "$OUTPUT"

