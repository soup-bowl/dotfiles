#!/usr/bin/env bash

set -eu;

# Setup SSH commit signing.
if [[ ! -z $SSHSIGN_PUB  ]]; then
    mkdir -p $HOME/.gitsign;
    echo -n "$SSHSIGN_PUB" | base64 --decode > $HOME/.gitsign/id_rsa.pub;
    echo -n "$SSHSIGN_PRV" | base64 --decode > $HOME/.gitsign/id_rsa;
    git config --global gpg.format ssh;
    git config --global user.signingkey "$HOME/.gitsign/id_rsa.pub";
    git config --global commit.gpgsign true;
# Setup GPG commit signing.
elif [[ ! -z $GNUGPG  ]]; then
    rm -rf $HOME/.gnupg;
    (cd $HOME ; echo $GNUGPG | base64 -d | tar --no-same-owner -xzvf -);
    git config --global commit.gpgsign true;
fi

# Setup Fish.
sudo apt-get install -y fish zsh;

# Setup ZSH.
# Based on https://github.com/trumbitta/dotfiles/blob/main/install.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended;

# Gitpod Only.
if test ! -e /ide/bin/remote-cli/gp-code || test ! -v GITPOD_REPO_ROOT; then
    tee -a $HOME/.zshrc <<'EOF'
    for i in $(ls -A $HOME/.bashrc.d/); do source $HOME/.bashrc.d/$i; done

    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    alias gp="gp"
    EOF
fi
