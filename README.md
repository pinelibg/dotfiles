# pinelibg's dotfiles

[![Lint files](https://github.com/pinelibg/dotfiles/actions/workflows/lint.yml/badge.svg?branch=main&event=push)](https://github.com/pinelibg/dotfiles/actions/workflows/lint.yml?query=event%3Apush+branch%3Amain)
[![Test install](https://github.com/pinelibg/dotfiles/actions/workflows/test.yml/badge.svg?branch=main&event=push)](https://github.com/pinelibg/dotfiles/actions/workflows/test.yml?query=event%3Apush+branch%3Amain)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

This repository contains my personal configuration files for shells and editors.

## Features

- uses [chezmoi](https://www.chezmoi.io/) to manage dotfiles
- runs on Linux, macOS and Windows
- contains settings for
  - Bash (shell)
  - Zsh (shell)
  - PowerShell (shell)
  - Neovim (editor)

## Install

### Quick Install

Install dotfiles with a single command:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "${HOME}/.local/bin" init --apply pinelibg
```

### Alternative Methods

#### Using existing chezmoi

If you already have chezmoi installed ([Install chezmoi](https://www.chezmoi.io/install/)):

```sh
chezmoi init --apply pinelibg
```

#### Manual setup

Clone and run the setup script:

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
