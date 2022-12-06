#!/usr/bin/env bash

set -eu;

if test ! -e /ide/bin/remote-cli/gp-code || test ! -v GITPOD_REPO_ROOT; then {
    printf 'error: This script is meant to be run on Gitpod, quitting...\n' && exit 1;
} fi

# Setup GPG.
if [[ ! -z $GNUGPG  ]]
    rm -rf ~/.gnupg;
    (cd ~ ; echo $GNUGPG | base64 -d | tar --no-same-owner -xzvf -);
fi

# Setup Fish.
sudo apt-get install -y fish zsh;

# Setup ZSH.
# Based on https://github.com/trumbitta/dotfiles/blob/main/install.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended;

tee -a $HOME/.zshrc <<'EOF'
for i in $(ls -A $HOME/.bashrc.d/); do source $HOME/.bashrc.d/$i; done

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

alias gp="gp"
EOF
