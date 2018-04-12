
project-name = hello_python

version-string := $(shell grep '__version__ = '  $(project-name)/version.py)
version := $(subst __version__ = ,,$(version-string))

install:
	pipenv run python setup.py install
	pipenv install

develop:
	pipenv run python setup.py develop
	pipenv install --dev --skip-lock

cleanall: clean-build clean-pyc clean-env

clean: clean-build clean-pyc

clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr *.egg-info
	find . -name docker_target -exec rm -rf {} +

clean-env:
	pipenv --rm

clean-pyc:
	find . -name '*.pyc' -delete
	find . -name '*.pyo' -delete
	find . -name '*~' -delete
	find . -name '__pycache__' -exec rm -rf {} +
	find . -name '*.log*' -delete

lint:
	pipenv run flake8 $(project-name)

test:
	scripts/test.sh $(opts) -- -x -q

testall:
	pipenv run pytest

testloop:
	scripts/test.sh -m -- -x -q

release: clean
	pipenv run python setup.py sdist --formats gztar bdist_wheel

upload: release tag
	scripts/deploy.sh

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
