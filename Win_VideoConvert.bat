@echo off

echo "Do you have ffmpeg available?"
@echo:"%path%" | find "ffmpeg" > nul

IF %errorlevel% NEQ 0 (
echo "ffmpeg not found, have you installed it correctly?"
Call :t_out
exit 3
) ELSE (
echo "ffmpeg found"
)

:: Check if Video dir exists, cd if yes, warn and exit if no
echo "Changing directory to to Videos folder"
IF exist Videos (
cd Videos
echo "Success!"
) ELSE (
echo "Videos folder not found, is this file in the right place?."
Call :t_out
exit 3
)

:: Check if output dir exists, if no then make

echo "Does output folder exist?"
IF not exist output (
mkdir output
echo "No, output created"
) ELSE (
echo "Yes"
)

echo "Starting conversion in 10 seconds"
timeout /t 10
FOR %%i in ( *.mp4 ) DO (ffmpeg -i %%i -g 15 -c:a aac output\%%~ni_converted.mp4)
CLS
echo "Conversion complete!"
timeout /t -1
exit 0

:t_out
timeout /t -1
exit /B 0