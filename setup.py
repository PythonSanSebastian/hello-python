#!/usr/bin/env python

"""A setuptools based setup module.

See:
https://packaging.python.org/en/latest/distributing.html
https://github.com/pypa/sampleproject
"""

import io

from setuptools import setup, find_packages

MODULE_NAME = 'hello_python'

REQUIRES = [
    'arrow==3.4', # this is just an example, can be removed.
]



# long description
def read(*filenames, **kwargs):
    encoding = kwargs.get('encoding', 'utf-8')
    sep = kwargs.get('sep', '\n')
    buf = []
    for filename in filenames:
        with io.open(filename, encoding=encoding) as f:
            buf.append(f.read())
    return sep.join(buf)


setup_dict = dict(
    name=MODULE_NAME,
    version="0.0.1",
    description='hello_python',
    url='https://github.com/pythonsansebastian/hello_python',

    # Author details
    author='',
    author_email='',

    packages=find_packages(),
    include_package_data=True,
    data_files=[],
    long_description=read('README.md'),
)


if __name__ == '__main__':
    setup(**setup_dict)
