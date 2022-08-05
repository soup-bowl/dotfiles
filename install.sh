#!/usr/bin/env bash

set -eu;

if test ! -e /ide/bin/remote-cli/gp-code || test ! -v GITPOD_REPO_ROOT; then {
    printf 'error: This script is meant to be run on Gitpod, quitting...\n' && exit 1;
} fi

# Setup ZSH.
# Based on https://github.com/trumbitta/dotfiles/blob/main/install.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended;

# From the Gitpod .bashrc.
for i in $(ls -A $HOME/.bashrc.d/); do source $HOME/.bashrc.d/$i; done

if [[ -n $SSH_CONNECTION ]]; then cd "/workspace/sparkling-child"; fi
