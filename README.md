# dotfiles [![Build Status](https://travis-ci.org/svrana/dotfiles.svg?branch=master)](https://travis-ci.org/svrana/dotfiles)

Deprecated. I moved to home-manager. My home-manager configuration and nixos configurations are located [here](https://github.com/svrana/nix-home).


These dotfiles use the [bash-home-scaffold](https://github.com/svrana/bash-home-scaffold) to link configuration files, create directories, install packages and to break functionality into [plugins](https://github.com/svrana/dotfiles/tree/master/plugins) and [installers](https://github.com/svrana/dotfiles/tree/master/installers).

## Getting Started

```
curl -L dotfiles.vranix.com/bootstrap | bash
```

By default this will clone this repo into ~/.dotfiles and the bash-home-scaffold repo into ~/Projects/bash-home-scaffold. To customize, take a look at the [bootstrap](https://github.com/svrana/dotfiles/tree/master/bootstrap) code.
