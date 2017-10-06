if [ ! -d "$APPS/solarize" ]; then
    git clone https://github.com/gmodarelli/solarize.git "$APPS/solarize"
    return $("$APPS/solarize/solarize.sh" dark)
fi

return 0
