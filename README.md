This repository contains veewee box definitions.

See https://github.com/jedi4ever/veewee

# ubuntu-12.04.4.desktop-i386/amd64 boxes

Desktop boxes for the latest 12.04 LTS release. LibreOffice and Thunderbird are
removed to reduce the image size.

Please note that the amd64 box is not holding any files on it's own.
It's made out of symlinks to the i386 definition. This prevents that
the two boxes get out of sync. Changing the i386 files will also
change the amd64 box.
