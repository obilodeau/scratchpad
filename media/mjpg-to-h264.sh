#!/bin/bash
#
# Batch processes my camera's MJPG files into h264 ones to save some space
#
# Built upon my previous work:
# https://github.com/obilodeau/nautilus-scripts/blob/master/x264-encode.sh
#
# Copyright (c) 2011, 2012, 2015 Olivier Bilodeau <olivier@bottomlesspit.org>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are
# permitted provided that the following conditions are met:
#
#    1. Redistributions of source code must retain the above copyright notice, this list of
#       conditions and the following disclaimer.
#
#    2. Redistributions in binary form must reproduce the above copyright notice, this list
#       of conditions and the following disclaimer in the documentation and/or other materials
#       provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY OLIVIER BILODEAU ``AS IS'' AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL OLIVIER BILODEAU OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# TODO: support automatic rotation of videos

DIR=$1

# change IFS to newline to handle special file names in for loop
OLDIFS=$IFS
IFS=$'\n'

# Quality
BITRATE=2000 # good for 720x480 30 fps interlaced, 640x480 30 fps
#BITRATE=50 # was good for 320x200 30 fps (but probably wrong.. old mencoder bug/feature maybe?)

# additional x264enc options
X264_OPTS=
#X264_OPTS=:interlaced

# Audio codec
# older Canon A70 required AUDIO_CODEC=copy because the weird raw PCM properties prevented
# transcoding into mp3lame
AUDIO_CODEC=mp3lame

for FILE in `exiftool -r -if '$Compression =~ /MJPG/i' -filename $DIR  | grep -v ".orig$" | grep "^======== " | sed 's/^======== //'`; do

	# first pass
	echo "# File $FILE: First pass encoding"
	cd /tmp
	mencoder "$FILE" -ovc x264 -x264encopts pass=1:bitrate=$BITRATE$X264_OPTS -nosound -o /dev/null
	if [ $? -ne  0 ]; then
		echo "Something went wrong with file: $FILE, bailing out"
		exit
	fi

	# second pass
	echo "# File $FILE: Second pass encoding"
	cd /tmp
	mencoder "$FILE" -ovc x264 -x264encopts pass=2:bitrate=$BITRATE$X264_OPTS -oac $AUDIO_CODEC -o "$FILE.tmp"
	if [ $? -ne 0 ]; then
		echo "Something went wrong with file: $FILE, bailing out"
		exit
	fi

	# renaming files and removing temp files
	echo "# File $FILE: Renaming and cleaning-up"
	rm /tmp/divx2pass.log
	rm /tmp/divx2pass.log.mbtree

	mv "$FILE" "$FILE.orig"
	mv "$FILE.tmp" "$FILE"

IFS=$OLDIFS

done
