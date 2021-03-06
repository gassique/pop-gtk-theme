#! /bin/bash
#
# This file is part of pop-gtk-theme
#
# Copyright (C) 2016-2017 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

SRC_FILE="../assets-gtk2.svg"
COL_FILE="../../sass/common/_colors.scss"
KEY_FILE="../../sass/common/_key_colors.scss"

# Default colours
selection1="`grep 'Cyan500' $COL_FILE | \
                   cut -d' ' -f3`"
accent1="`grep 'Teal300' $COL_FILE | \
                cut -d' ' -f3`"

# Check and re-color color-scheme
if [ -e $KEY_FILE ]; then
    selection2="`grep 'key_selection' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    accent2="`grep 'key_accent' $KEY_FILE | \
              cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $SRC_FILE.in $SRC_FILE && sleep 1

    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/gi" $SRC_FILE
        echo $selection1 is re-colored with $selection2.
    fi
    if [ $accent1 != $accent2 ]; then
        sed -i "s/$accent1/$accent2/gi" $SRC_FILE
        echo $accent1 is re-colored with $accent2.
    fi
else
    echo _key_colors.scss was not found. Stopped...
    exit 1
fi
