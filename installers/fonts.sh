#!/bin/bash

install() {
    local added_font="false"
    local FONT_DIR="$HOME/.local/share/fonts"

    # yosemite font (for the i3 polybar text)
    local YOSEMITE_URL="https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip"
    if [ ! -f "$FONT_DIR/sf-font.zip" ]; then
        curl -L -sSf -o "$FONT_DIR/sf-font.zip" "$YOSEMITE_URL"
        pushd "$FONT_DIR"
        if unzip "$FONT_DIR/sf-font.zip" ; then
            added_font="true"
        fi
        popd
    fi

    # font awesome for the glyphs I use in i3/polybar
    local FA_URL="https://fontawesome.com/v4.7.0/assets/font-awesome-4.7.0.zip"
    if [ ! -f "$FONT_DIR/font-awesome.zip" ]; then
        curl -L -sSf -o "$FONT_DIR/font-awesome.zip" "$FA_URL"
        pushd "$FONT_DIR"
        if unzip "$FONT_DIR/font-awesome.zip" ; then
            added_font="true"
        fi
        popd
    fi

    if [ "$added_font" == "true" ] ; then
        fc-cache -fv
    fi
}

install
