export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="$HOMEBREW_CELLAR/Cellar"
export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX/Homebrew"
export HOMEBREW_MANPATH="${HOMEBREW_PREFIX}/share/man"

PATH_append "$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin"

if [[ ! "$MANPATH" == *$HOMEBREW_MANPATH* && -d "$HOMEBREW_PREFIX" ]]; then
  export MANPATH="$MANPATH:$HOMEBREW_MANPATH"
fi
