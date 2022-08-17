# pinelibg's dotfiles

[![Lint files](https://github.com/pinelibg/dotfiles/actions/workflows/lint.yml/badge.svg?branch=master&event=push)](https://github.com/pinelibg/dotfiles/actions/workflows/lint.yml?query=event%3Apush+branch%3Amaster)
[![Test install](https://github.com/pinelibg/dotfiles/actions/workflows/test.yml/badge.svg?branch=master&event=push)](https://github.com/pinelibg/dotfiles/actions/workflows/test.yml?query=event%3Apush+branch%3Amaster)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

This repository contains my personal configuration files for shells and editors.

## Features

- creates symbolic links of configuration files from home directory ([install.sh](install.sh))
- runs on Linux and macOS
- contains settings for
  - Bash (shell)
  - Zsh (shell)
  - Neovim (editor)

## Install

To use it, run the following commands in the terminal.

```sh
git clone https://github.com/pinelibg/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Licence

The code is available under the MIT license.
See the [LICENSE.txt](LICENSE.txt) file for more information.
