
# Python Hello World Project

[![](https://img.shields.io/pypi/v/hello-python.svg)](https://pypi.org/project/hello-python/)
[![](https://travis-ci.org/PythonSanSebastian/hello-python.svg?branch=master)](https://travis-ci.org/PythonSanSebastian/hello-python)
[![](https://api.codeclimate.com/v1/badges/a39e55b85bfcc31204b9/maintainability)](https://codeclimate.com/github/PythonSanSebastian/hello-python/maintainability)
[![](https://api.codeclimate.com/v1/badges/a39e55b85bfcc31204b9/test_coverage)](https://codeclimate.com/github/PythonSanSebastian/hello-python/test_coverage)
[![](https://readthedocs.org/projects/hello-python/badge/?version=latest)](https://hello-python.readthedocs.io/en/latest/)
[![](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![](https://badges.renovateapi.com/github/PythonSanSebastian/hello-python)](https://renovatebot.com/)


This is a Python project skeleton.
Based on Makefile, pipenv, and pytest.

You need `pipenv` and `make` installed.

Replace all occurrences of `hello_python` for your project name.
Rename the `hello_python` folder to your project name.
Also `PythonSanSebastian` to your team name.

## Contents

* [Examples](examples.md)

## Getting started

Install `hello-python` with:

```bash
pip install hello-python
```

## Using the source code

This project uses [pipenv](https://pipenv.readthedocs.io) to manage its dependencies
and Python environment. You can install it by:

```bash
pip install --user pipenv
```

We recommend using a Python virtual environment for each separate project you do.
For that, we suggest using [pyenv](https://github.com/pyenv/pyenv-installer).

### Installation

For production, after you clone this repository,
you can install this project plus dependencies with:

```bash
cd <clone_dest>
make install
```

### Development

For development you should also install the development dependencies,
so run instead:

```bash
cd <clone_dest>
make install-dev
```

This will install all dependencies and this project in development mode.

### Testing

We use [tox](https://tox.readthedocs.io/en/latest/) to run the code checkers.

You can run the tests by running `tox` in the top-level of the project.
