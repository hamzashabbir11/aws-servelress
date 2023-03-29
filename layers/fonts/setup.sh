#!/usr/bin/env bash

mkdir -p fonts

curl "https://fonts.google.com/download?family=Open%20Sans" --silent -o fonts/OpenSans.zip
unzip -q fonts/OpenSans.zip -d fonts/
rm fonts/OpenSans.zip

cat <<EOT > fonts/fonts.conf
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <dir>/opt/fonts</dir>
    <cachedir>/tmp/fonts-cache/</cachedir>
    <config></config>
</fontconfig>
EOT

zip -r fonts.zip .
rm -rf fonts
