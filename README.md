# pinelibg's dotfiles

[![Lint files](https://github.com/pinelibg/dotfiles/actions/workflows/lint.yml/badge.svg?branch=main&event=push)](https://github.com/pinelibg/dotfiles/actions/workflows/lint.yml?query=event%3Apush+branch%3Amain)
[![Test install](https://github.com/pinelibg/dotfiles/actions/workflows/test.yml/badge.svg?branch=main&event=push)](https://github.com/pinelibg/dotfiles/actions/workflows/test.yml?query=event%3Apush+branch%3Amain)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

This repository contains my personal configuration files for shells and editors.

## Features

- uses [chezmoi](https://www.chezmoi.io/) to manage dotfiles
- runs on Linux and macOS
- contains settings for
  - Bash (shell)
  - Zsh (shell)
  - Neovim (editor)

## Install

Install [chezmoi](https://www.chezmoi.io/) and dotfiles with the single command:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply pinelibg
```

Or you can run the following commands in the terminal.

```sh
git clone https://github.com/pinelibg/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Migration

If you're upgrading from the previous version of this dotfiles repository, see [Migration Guide](docs/MIGRATION.md).

## License

The code is available under the MIT license.
See the [LICENSE.txt](LICENSE.txt) file for more information.
