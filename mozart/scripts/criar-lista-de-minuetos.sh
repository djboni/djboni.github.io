#!/bin/sh
#==================================================================================
#      AUTHOR:	D.A. Boni (djboni@gmail.com)
#     VERSION:	1.0.0
#     LICENSE:	Creative Commons Attribution 4.0 International License (CC-BY)
#     CREATED:	2017.08.12 19:24:34 +8
#    REVISION:	2017.08.30 12:10:25 +8
#==================================================================================

# Referencia: Minueto para Teoria Musical
./criar-minuetos-com-dados.sh 7  7  5  12   9  6  5  8    7  9  12 11   10 7  11 5

# Referencia: Minueto para Instruções do Jogo de dados de Mozart
./criar-minuetos-com-dados.sh 2  2  5  4    10 12 11 9    2  10 9  5    10 11 3  11

# Proposta: Minueto mais provável
./criar-minuetos-com-dados.sh 7  7  7  7    7  7  7  7    7  7  7  7    7  7  7  7

# Proposta: Minueto menos provável 1 e 2
./criar-minuetos-com-dados.sh 2  2  2  2    2  2  2  2    2  2  2  2    2  2  2  11
./criar-minuetos-com-dados.sh 12 12 12 12   12 12 12 12   12 12 12 12   12 12 12 11

# Outros minuetos
./criar-minuetos-com-dados.sh  3  3  3  3    3  3  3  3    3  3  3  3    3  3  3  3
./criar-minuetos-com-dados.sh  4  4  4  4    4  4  4  4    4  4  4  4    4  4  4  4
./criar-minuetos-com-dados.sh  5  5  5  5    5  5  5  5    5  5  5  5    5  5  5  5
./criar-minuetos-com-dados.sh  6  6  6  6    6  6  6  6    6  6  6  6    6  6  6  6
./criar-minuetos-com-dados.sh  8  8  8  8    8  8  8  8    8  8  8  8    8  8  8  8
./criar-minuetos-com-dados.sh  9  9  9  9    9  9  9  9    9  9  9  9    9  9  9  9
./criar-minuetos-com-dados.sh 10 10 10 10   10 10 10 10   10 10 10 10   10 10 10 10
./criar-minuetos-com-dados.sh 11 11 11 11   11 11 11 11   11 11 11 11   11 11 11 11

# Referencia: Minueto para Artigo
./criar-minuetos-com-dados.sh 10 7 7 2 5 5 6 9 4 7 8 9 7 8 7 6

# Referencia: Minueto para Apresentacao EEPROFMAT
./criar-minuetos-com-dados.sh 2 6 3 7 7 6 10 11 11 8 11 6 7 6 3 10

# Referencia: Minueto para Apresentacao Defesa
./criar-minuetos-com-dados.sh 11 3 12 4 12 5 2 12 8 11 5 2 12 3 6 10

#./criar-minuetos-com-dados.sh -- -- -- --   -- -- -- --   -- -- -- --   -- -- -- --

## ZIP: MP3 PNG MIDI SVG PDF
zip K516f-mp3 mp3/*.mp3
zip K516f-png png/*.png
zip K516f-mid mid/*.mid
zip K516f-svg svg/*.svg
zip K516f-pdf pdf/*.pdf
zip K516f-mp4 mp4/*.mp4
mkdir -p zip; mv *.zip zip

