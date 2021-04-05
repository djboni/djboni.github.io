#!/bin/sh
#==================================================================================
#      AUTHOR:	D.A. Boni (djboni@gmail.com)
#     VERSION:	1.0.0
#     LICENSE:	Creative Commons Attribution 4.0 International License (CC-BY)
#     CREATED:	2017.08.12 19:24:34 +8
#    REVISION:	2017.08.30 12:10:25 +8
#==================================================================================

# Usage: ./MIDI-para-MP4.sh IN_MIDI.mid OUTPUT.mp4 WIDTH HEIGHT

usage(){
  echo "Usage: ./MIDI-para-MP4.sh IN_MIDI.mid OUTPUT.mp4 WIDTH HEIGHT"
}

if [ $# -ne 4 ]; then
  usage
  exit 1
else
  IN_MIDI="$1"
  OUTPUT="$2"
  WIDTH="$3"
  HEIGHT="$4"
  
  TEMP_AUDIO="$OUTPUT.audio.mp3"
  TEMP_VIDEO="$OUTPUT.noaudio.mp4"

  echo "Creating MP4 from MIDI and MP3: ($IN_MIDI) -> $OUTPUT ($WIDTH x $HEIGHT)"
fi

# O conversor ./MIDIVisualizer deve existir
[ -f MIDIVisualizer ] && {
  # Cria MP4
  ./MIDIVisualizer --midi "$IN_MIDI" --size "$WIDTH" "$HEIGHT" \
          --config config.ini  --format MPEG4 \
            --export "$TEMP_VIDEO" --hide-window 1

  # Cria MP3
  timidity "$IN_MIDI" -Ow -o - | lame - -b 64 "$TEMP_AUDIO"
  #timidity "$IN_MIDI" -Ow -o - | ffmpeg -i - -acodec libmp3lame -ab 64k "$TEMP_AUDIO"

  # Une MP4 e MP3
  ffmpeg  -i "$TEMP_VIDEO" -itsoffset 1.00 \
        -i "$TEMP_AUDIO" \
        -c copy -map 0:v:0 -map 1:a:0 \
        "$OUTPUT"
  
  # Apaga temporários
  rm -f "$TEMP_VIDEO" "$TEMP_AUDIO"
}

