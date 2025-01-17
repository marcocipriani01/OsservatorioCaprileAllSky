#!/bin/bash

# NOTES:
#  - Variable names must start at the beginning of a line.
#  - There should be nothing after a variable's value, i.e., no comments on the same line.
#  - Values can optionally be quoted with double quotes, NOT single quotes.
#  - If a variable occurs multiple times, only the last value is used.

# Choose between "ZWO" or "RPiHQ".
CAMERA="RPiHQ"


########## Images
# Set to "true" to upload the current image to your website.
IMG_UPLOAD="false"

# If IMG_UPLOAD is "true", upload images every IMG_UPLOAD_FREQUENCY frames, e.g., every 5 frames.
# 1 uploades every frame.
IMG_UPLOAD_FREQUENCY=1

# The websites look in IMG_DIR for the current image.
# When using the Allsky website from the "allsky-website" packge,
# "current" is an alias for "/home/pi/allsky".
# If you use the default IMG_DIR and have the Allsky website, set "imageName" in
# /var/www/html/allsky/config.js to:
#     imageName: "/current/tmp/image.jpg",
# This avoids copying the image to the website.
# Only change IMG_DIR if you know what you are doing.
IMG_DIR="current/tmp"

# Resize images before cropping, stretching, and saving.
# Adjust IMG_WIDTH and IMG_HEIGHT according to your camera's sensor ratio.
IMG_RESIZE="false"
IMG_WIDTH=2028
IMG_HEIGHT=1520

# Crop images before stretching and saving.
# This is useful to remove some of the black border when using a fisheye lens.
# If you crop an image you may need to change the "Text X" and/or "Text Y" settings in the WebUI.
CROP_IMAGE="false"
CROP_WIDTH=640
CROP_HEIGHT=480
CROP_OFFSET_X=0
CROP_OFFSET_Y=0

# Auto stretch images saved at night.
AUTO_STRETCH="false"
AUTO_STRETCH_AMOUNT=10
AUTO_STRETCH_MID_POINT="10%"

# Resize uploaded images.  Change the size to fit your sensor.
RESIZE_UPLOADS="false"
RESIZE_UPLOADS_SIZE="962x720"

# Create thumbnails of images.  If you are not running the WebUI consider changing this to "false".
IMG_CREATE_THUMBNAILS="true"

# Remove corrupt images before generating keograms, startrails, and timelapse videos.
# This only adds a few seconds per image as it's being processed.
REMOVE_BAD_IMAGES="false"

# If REMOVE_BAD_IMAGES is "true", images whose mean brightness is
# less than THRESHOLD_LOW or greater than THRESHOLD_HIGH percent (max: 100) will be removed.
# Set to 0 to disable the brightness checks.
REMOVE_BAD_IMAGES_THRESHOLD_LOW=1
REMOVE_BAD_IMAGES_THRESHOLD_HIGH=90

# Additional Capture parameters.  Run "capture_RPiHQ -h" to see the options.
# e.g. activate autoexposure algorithm "mean" for RPiHQ: "-nightmean 0.3 -daymean 0.3"
CAPTURE_EXTRA_PARAMETERS=""

# Set to "false" to disable daytime capture.
DAYTIME_CAPTURE="true"

# Night images are always taken and saved to disk.
# Setting DAYTIME_SAVE to "true" also saves daytime images to disk.
# Will only save daytime images if DAYTIME_CAPTURE="true".
DAYTIME_SAVE="false"


########## Timelapse
# Set to "true" to generate a timelapse video at the end of each night.
TIMELAPSE="true"

# Set the resolution of the timelapse video (sizes must be EVEN numbers).
# 0 disables resize and uses the same resolution as the images.
TIMELAPSEWIDTH=1024
TIMELAPSEHEIGHT=768

# Bitrate of the timelapse video.  Higher numbers will produce higher quality but larger files.
TIMELAPSE_BITRATE="2000k"

# Timelapse video Frames Per Second.
FPS=15

# Encoder for timelapse video. May be changed to use a hardware encoder or different codec.
VCODEC="libx264"

# Pixel format.
PIX_FMT=${PIX_FMT:-yuv420p}

# FFLOG determines the amount of log information displayed while creating a timelapse video.
# Set to "info" to see additional information if you are tuning the algorithm.
FFLOG="warning"

# While creating a timelapse video, a sequence of links to the images is created.
# Set to "true" to keep that sequence; set to "false" to have it deleted when done.
KEEP_SEQUENCE="false"

# Any additional timelapse parameters.  Run "ffmpeg -?" to see the options.
TIMELAPSE_EXTRA_PARAMETERS=""

# Set to "true" to upload timelapse video to your website at the end of each night.
UPLOAD_VIDEO="false"


########## Keogram
# Set to "true" to generate a keogram at the end of each night.
KEOGRAM="false"

# Additional Keogram parameters.  Run "keogram --help" to see the options.
KEOGRAM_EXTRA_PARAMETERS="--font-size 1.0 --font-line 1 --font-color '255 255 255'"

# Set to "true" to upload the keogram to your website at the end of each night.
UPLOAD_KEOGRAM="false"


########## Startrails
# Set to "true" to generate a startrails image of each night.
STARTRAILS="false"

# Images with a brightness higher than this threshold will be skipped for
# startrails image generation.  Values are 0.0 to 1.0.
BRIGHTNESS_THRESHOLD=0.1

# Any additional startrails parameters.  Run "startrails --help" to see the options.
STARTRAILS_EXTRA_PARAMETERS=""

# Set to "true" to upload the startrails image to your website at the end of each night.
UPLOAD_STARTRAILS="false"


########## Other
# Size of thumbnails.
THUMBNAIL_SIZE_X=100
THUMBNAIL_SIZE_Y=75

# Set this value to the number of days images plus videos you want to keep.
# Set to "" to keep ALL days.
DAYS_TO_KEEP=2

# Same as DAYS_TO_KEEP, but for the Allsky website, if installed.
# Set to "" to keep ALL days.
WEB_DAYS_TO_KEEP=5

# Set to "true" to upload data to your server at the end of each night.
# This is needed if you are running the Allsky Website.
POST_END_OF_NIGHT_DATA="true"

# Set to "true" if you want to enable dark frame subtraction on your night-time images.
# You must first create dark frames - see the README.md file for instructions.
DARK_FRAME_SUBTRACTION="false"

# If you have additional data or buttons you want displayed on the WebUI's System page,
# specify one or more colon-separated files that contain that data.
# You must provide scripts to update those files.
# See the WEBUI_DATA_FILES configuration variable in the "Software settings" section of
# https://github.com/thomasjacquin/allsky/wiki/allsky-Settings for details.
WEBUI_DATA_FILES=""

# The uhubctl command can reset the USB bus if the camera isn't found and you know it's there.
# Allsky.sh uses this to try and fix "missing" cameras.
# Specify the path to the command and the USB bus number (on a Pi 4, bus 1 is USB 2.0 and
# bus 2 is the USB 3.0 ports).  If you don't have 'uhubctl' installed set UHUBCTL_PATH="".
UHUBCTL_PATH=""
UHUBCTL_PORT=2

# Path to the camera settings (exposure, gain, delay, overlay, etc) files.
# Do not change unless you know what you are doing.
CAMERA_SETTINGS_DIR="/etc/raspap"


# ================ Do not change anything below this line.
END_OF_USER_SETTINGS="true"		# During upgrades, stop looking for variables here.

if [ "${CAMERA}" = "" ]; then
	echo "${RED}ERROR: Please set CAMERA in config/config.sh${NC}"
	sudo systemctl stop allsky
	exit 100
fi

# COMPATIBILITY CHECK
if [ -z "${DAYS_TO_KEEP}" ]; then		# Old version had AUTO_DELETE and NIGHTS_TO_KEEP
	AUTO_DELETE="false"
else
	AUTO_DELETE="true"
	NIGHTS_TO_KEEP="${DAYS_TO_KEEP}"
fi

# This is needed in case the user changed the default location the current image is saved to.
if [ "${IMG_DIR}" = "current/tmp" ]; then
	CAPTURE_SAVE_DIR="${ALLSKY_TMP}"
else
	CAPTURE_SAVE_DIR="${IMG_DIR}"
fi

CAMERA_SETTINGS="${CAMERA_SETTINGS_DIR}/settings_${CAMERA}.json"

# Get the name of the file the websites will look for, and split into name and extension.
FULL_FILENAME=$(jq -r '.filename' "$CAMERA_SETTINGS")
EXTENSION="${FULL_FILENAME##*.}"
FILENAME="${FULL_FILENAME%.*}"
 
# So scripts can conditionally ouput messages; DO NOT CHANGE NEXT LINES.
ALLSKY_DEBUG_LEVEL=$(jq -r '.debuglevel' "${CAMERA_SETTINGS}")
