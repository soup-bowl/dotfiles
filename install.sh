#!/usr/bin/env bash

set -eu;

# Setup ZSH.
# Based on https://github.com/trumbitta/dotfiles/blob/main/install.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended;
