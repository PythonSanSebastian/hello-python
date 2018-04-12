#!/bin/bash

if [ $(command -v pipenv) ]; then
    echo "Found 'pipenv' in your PATH: $(which pipenv)."
else
    echo "Installing pipenv and wheel in your system's Python environment."
    sudo pip3 install -U pipenv
fi
