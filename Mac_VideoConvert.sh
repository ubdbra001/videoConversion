#!/bin/bash

# Check ffmpeg is installed
# If yes then keep going
# If no then end here and display message
echo "Do you have ffmpeg available?"

if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg not found, have you installed it correctly?"
	sleep 5
    exit
else
	echo "ffmpeg found"
fi


# Check 'Videos' dir exists
# If yes then move into dir
# If no then end here and display message
echo "Changing directory to to Videos folder"

if [ ! -d Videos ]; then
	echo "Videos folder not found, is this file in the right place?"
	sleep 5
	exit
else
	cd Videos
	echo "Success!"
fi

# Check 'output' dir exists
# If no, create it
# If yes, great
echo "Does the output folder already exist?"

if [ ! -d output ]; then
	mkdir output
	echo "No, output folder created"
else
	echo "Yes"
fi

echo "Starting conversion in 10 seconds"
sleep 10
# If we've got this far then run ffmpeg and convert the files
sleep 5
for f in *.mp4; do echo starting "$f"; ffmpeg -i "$f" -g 15 -acodec aac "output/$f"; done

# End with success message that lasts until key is pressed
clear 
# Maybe add number of files converted?
# $(ls *.mp4 -1 | wc -1)

echo "Files converted"
read -p "Press enter key to exit..."