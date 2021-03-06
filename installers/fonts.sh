#!/bin/bash

install() {
    local added_font="false"
    local FONT_DIR="$HOME/.local/share/fonts"


    if [ ! -f "$FONT_DIR/PowerlineSymbols.otf" ]; then
        ln -s "${DOTFILES}/misc/PowerlineSymbols.otf" "${FONT_DIR}/PowerlineSymbols.otf"
        added_font="true"
    fi

    # yosemite font (for the i3 polybar text)
    local YOSEMITE_URL="https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip"
    if [ ! -f "$FONT_DIR/sf-font.zip" ]; then
        download "$YOSEMITE_URL" "$FONT_DIR/sf-font.zip"
        pushd "$FONT_DIR"
        if unzip "$FONT_DIR/sf-font.zip" ; then
            added_font="true"
        fi
        popd
    fi

    # font awesome for the glyphs I use in i3/polybar
    local FA_URL="https://fontawesome.com/v4.7.0/assets/font-awesome-4.7.0.zip"
    if [ ! -f "$FONT_DIR/font-awesome.zip" ]; then
        download "$FA_URL" "$FONT_DIR/font-awesome.zip"
        pushd "$FONT_DIR"
        if unzip "$FONT_DIR/font-awesome.zip" ; then
            added_font="true"
        fi
        popd
    fi

    if [ ! -f "$FONT_DIR/PowerlineExtraSymbols.otf" ]; then
        local POWERLINE_SYMBOLS="https://github.com/ryanoasis/powerline-extra-symbols/blob/master/PowerlineExtraSymbols.otf"

        if download "$POWERLINE_SYMBOLS" "$FONT_DIR/PowerlineExtraSymbols.otf" ; then
            added_font="true"
        fi
    fi

    # source code pro for spacemacs
    if [ ! -d "$FONT_DIR/source-code-pro" ]; then
        git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git "$FONT_DIR/source-code-pro"
        added_font="true"
    fi

    if [ "$added_font" == "true" ] ; then
        fc-cache -fv
    fi
}

install
