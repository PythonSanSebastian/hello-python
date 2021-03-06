.PHONY: help clean clean-pyc clean-build list test test-dbg test-cov test-all coverage docs release sdist install install-dev install-ci lint mypy isort isort-check

project-name = hello_python

version-var := "__version__ = "
version-string := $(shell grep $(version-var) $(project-name)/version.py)
version := $(subst __version__ = ,,$(version-string))


help:
	@echo "install - install"
	@echo "install-dev - install also development dependencies"
	@echo "clean - clean all below"
	@echo "clean-build - remove build artifacts"
	@echo "clean-pyc - remove Python file artifacts"
	@echo "clean-tox - clean tox cache"
	@echo "lint - check style with flake8"
	@echo "test - run tests quickly with the default Python"
	@echo "test-cov - run tests with the default Python and report coverage"
	@echo "test-dbg - run tests and debug with pdb"
	@echo "develop - run tests in loop mode"
	@echo "deploy - deploy"
	@echo "mypy - check type hinting with mypy"
	@echo "isort - sort imports"
	@echo "isort-check - check if your imports are correctly sorted"
	@echo "build - create the distribution package"
	@echo "release - package a release in wheel and tarball, requires twine"

install:
	python -m pip install pipenv
	pipenv install
	python -m pip install .

install-ci:
	python -m pip install pipenv
	pipenv install --dev
	python -m pip install -e .

install-dev: install-ci
	pre-commit install

clean: clean-build clean-pyc clean-caches

clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	rm -fr *.egg-info
	rm -fr *.spec

clean-pyc:
	pyclean $(project-name)
	find . -name '*~' -exec rm -f {} +
	find . -name __pycache__ -exec rm -rf {} +
	find . -name '*.log*' -delete
	find . -name '*_cache' -exec rm -rf {} +
	find . -name '*.egg-info' -exec rm -rf {} +

clean-caches:
	rm -rf .tox
	rm -rf .pytest_cache

lint:
	tox -e lint

test:
	tox -e tests

mypy:
	tox -e mypy

isort-check:
	tox -e isort

isort:
	isort -rc hello_python/

test-cov:
	py.test --cov-report term-missing --cov=$(project-name)

test-dbg:
	py.test --pdb

develop:
	py.test --color=yes -f

coverage:
	pytest --cov=hansel
	coverage report -m

build:
	python -m pip install pep517
	python -m pep517.build -s -b .

pypi:
	twine upload dist/*

release: clean build pypi

tag:
	$(eval GIT_VERSION=`git rev-parse --short HEAD`)

	@echo "Creating git tag v$(version)"
	@echo "Creating git tag $(GIT_VERSION)"

	git tag v$(version)
	git tag $(GIT_VERSION)
	git push --tags

patch:
	pipenv run bumpversion patch

minor:
	pipenv run bumpversion minor

major:
	pipenv run bumpversion major

prodtag: clean
	@echo "Creating git tag prod_`date "+%Y_%m_%d_%H_%M"`"
	git tag prod_`date "+%Y_%m_%d_%H_%M"`
	git push --tags

qatag: clean
	@echo "Creating git tag qa_`date "+%Y_%m_%d_%H_%M"`"
	git tag qa_`date "+%Y_%m_%d_%H_%M"`
	git push --tags

devtag: clean
	@echo "Creating git tag dev_`date "+%Y_%m_%d_%H_%M"`"
	git tag dev_`date "+%Y_%m_%d_%H_%M"`
	git push --tags

inttag: clean
	@echo "Creating git tag int_`date "+%Y_%m_%d_%H_%M"`"
	git tag int_`date "+%Y_%m_%d_%H_%M"`
	git push --tags
