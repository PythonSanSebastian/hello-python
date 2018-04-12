"""version.py tests."""

from distutils.version import StrictVersion

import pytest


@pytest.mark.version
class TestVersionNumber:

    def test_version(self):
        from hello_python import version

        assert StrictVersion(version.__version__)
