#!/bin/bash

echo "Checking node and npm"

if node -v > /dev/null; then
  if npm -v > /dev/null; then
    echo "node and npm is already installed."
  fi
else
  if apt-get -v > /dev/null; then
    echo "installing node and npm"
    curl -sL https://deb.nodesource.com/setup_8.7.0 | sudo -E bash -
    sudo apt-get install -y nodejs
    echo "installing build tools"
    sudo apt-get install -y build-essential
  else
    echo "apt-get is not installed"
  fi
  if port version > /dev/null; then
    echo "installing node and npm"
    sudo port install nodejs8
  else
    echo "port is not installed"
  fi
  if brew --version > /dev/null; then
    echo "installing node and npm"
    brew install node
  else
    echo "brew is not installed"
  fi
fi
