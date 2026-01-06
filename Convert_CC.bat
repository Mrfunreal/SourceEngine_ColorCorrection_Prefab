@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Incorrect use.
	echo Drag a .raw or .tga file onto this .bat, not the CMD window.
    echo.
	pause
    exit /b
)

set "INPUT=%~1"
set "EXT=%~x1"
set "NAME=%~n1"
set "DIR=%~dp1"

if /I "%EXT%"==".raw" (
    echo Converting RAW to TGA...
    ffmpeg -f rawvideo -pixel_format rgb24 -video_size 32x1024 -i "%INPUT%" "%DIR%%NAME%.tga"
    goto :done
)

if /I "%EXT%"==".tga" (
    echo Converting TGA to RAW...
    ffmpeg -i "%INPUT%" -vf scale=32:1024:flags=neighbor -pix_fmt rgb24 -f rawvideo "%DIR%%NAME%.raw"
    goto :done
)

echo Unsupported file type: %EXT%
echo Only .raw and .tga are supported.

:done
echo.
echo Done.
::pause
