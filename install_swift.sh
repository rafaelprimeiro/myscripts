#!/bin/bash
set -e

if [[ -d ~/.swiftenv ]]; then
    echo "Remove old..."
    rm -Rf ~/.swiftenv
fi

echo "Start download..."
git clone https://github.com/kylef/swiftenv.git ~/.swiftenv

echo "Configuring..."
if [[ $1 == 'mac' ]]; then
    echo 'export SWIFTENV_ROOT="$HOME/.swiftenv"' >> ~/.bash_profile
    echo 'export PATH="$SWIFTENV_ROOT/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(swiftenv init -)"' >> ~/.bash_profile

    echo 'export SWIFTENV_ROOT="$HOME/.swiftenv"' >> ~/.zshenv
    echo 'export PATH="$SWIFTENV_ROOT/bin:$PATH"' >> ~/.zshenv
    echo 'eval "$(swiftenv init -)"' >> ~/.zshenv
elif [[ $1 == 'linux' ]]; then
    echo 'Install dependences...'
    sudo apt-get install \
          binutils \
          git \
          gnupg2 \
          libc6-dev \
          libcurl4 \
          libedit2 \
          libgcc-9-dev \
          libpython2.7 \
          libsqlite3-0 \
          libstdc++-9-dev \
          libxml2 \
          libz3-dev \
          pkg-config \
          tzdata \
          zlib1g-dev \
          openssl \
          libssl-dev \
          libcurl4-openssl-dev \
          -y

    echo 'export SWIFTENV_ROOT="$HOME/.swiftenv"' >> ~/.bashrc
    echo 'export PATH="$SWIFTENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(swiftenv init -)"' >> ~/.bashrc
else 
    echo 'ERROR: required system <mac|linux> with first param'
    exit 8
fi

if [[ ! -z "$2" ]]; then
    echo "Install swift version ${2}"
    ~/.swiftenv/bin/swiftenv install $2
fi

echo "Done."
