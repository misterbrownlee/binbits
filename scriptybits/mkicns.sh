#!/usr/bin/env 
echo 'starting...'
ICONSET_NAME=$1
PNG_NAME=$2
mkdir $ICONSET_NAME
sips -z 16 16     $PNG_NAME.png --out $ICONSET_NAME/icon_16x16.png
sips -z 32 32     $PNG_NAME.png --out $ICONSET_NAME/icon_16x16@2x.png
sips -z 32 32     $PNG_NAME.png --out $ICONSET_NAME/icon_32x32.png
sips -z 64 64     $PNG_NAME.png --out $ICONSET_NAME/icon_32x32@2x.png
sips -z 128 128   $PNG_NAME.png --out $ICONSET_NAME/icon_128x128.png
sips -z 256 256   $PNG_NAME.png --out $ICONSET_NAME/icon_128x128@2x.png
sips -z 256 256   $PNG_NAME.png --out $ICONSET_NAME/icon_256x256.png
sips -z 512 512   $PNG_NAME.png --out $ICONSET_NAME/icon_256x256@2x.png
sips -z 512 512   $PNG_NAME.png --out $ICONSET_NAME/icon_512x512.png
sips -z 1024 1024 $PNG_NAME.png --out $ICONSET_NAME/icon_512x512@2x.png
cp $PNG_NAME.png $ICONSET_NAME/icon_512x512@2x.png
cp -r $ICONSET_NAME "$ICONSET_NAME.iconset"
iconutil -c icns "$ICONSET_NAME.iconset"
#rm -R $ICONSET_NAME
