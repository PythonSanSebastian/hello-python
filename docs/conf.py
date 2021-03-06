"""Configuration file for the Sphinx documentation builder."""

# This file only contains a selection of the most common options. For a full
# list see the documentation:
# http://www.sphinx-doc.org/en/master/config

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
import sys

from recommonmark.transform import AutoStructify

here = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(here))
# sys.path.insert(0, os.path.abspath('../'))

import hello_python # noqa # isort:skip


# -- Project information -----------------------------------------------------

project = 'hello-python'
copyright = '2019, Alexandre Savio'
author = 'Alexandre Savio'
language = None

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'recommonmark',
    'sphinx.ext.autodoc',
    'sphinx.ext.napoleon',
    'sphinx.ext.viewcode',
    'sphinxcontrib.apidoc',
    'sphinx.ext.autosummary',
    'sphinx.ext.autosectionlabel',
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# The master toctree document.
master_doc = 'index'

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

github_root = 'https://github.com/PythonSanSebastian/hello_python/tree'

github_doc_root = f'{github_root}/master/docs/'

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
version = hello_python.__version__
# The full version, including alpha/beta/rc tagss
release = hello_python.__version__

# -- Options for Apidoc --------------------------------------------------
apidoc_module_dir = hello_python.__path__[0]
apidoc_output_dir = 'source'
apidoc_excluded_paths = ['../hello_python/**/tests']
apidoc_separate_modules = True

# -- Options for Autodoc -------------------------------------------------
autoclass_content = 'class'
autodoc_member_order = 'bysource'
autodoc_mock_imports = ['arrow']
autosummary_generate = True

# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

# Prefix document path to section labels, otherwise autogenerated labels would look like 'heading'
# rather than 'path/to/file:heading'
autosectionlabel_prefix_document = True

# -- Options for manual page output ---------------------------------------

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [
    (
        master_doc,
        'hello-python',
        'Hello-Python Documentation',
        [author],
        1,
    ),
]

# If true, show URL addresses after external links.
# man_show_urls = False


# -- Options for Texinfo output -------------------------------------------

# Grouping the document tree into Texinfo files. List of tuples
# (source start file, target name, title, author,
#  dir menu entry, description, category)
texinfo_documents = [
    (
        master_doc,
        'hello-python',
        'Hello-Python Documentation',
        author,
        'Hello-Python',
        'An opinionated Python project skeleton.',
        'Miscellaneous',
    ),
]

# Documents to append as an appendix to all manuals.
# texinfo_appendices = []

# If false, no module index is generated.
# texinfo_domain_indices = True

# How to display URL addresses: 'footnote', 'no', or 'inline'.
# texinfo_show_urls = 'footnote'

# If true, do not generate a @detailmenu in the "Top" node's menu.
# texinfo_no_detailmenu = False


def setup(app):
    """Configure recommonmark.AutoStructify."""
    app.add_config_value(
        'hello_python_config', {
            'auto_toc_tree_section': 'Contents',
            'enable_eval_rst': True,
            'enable_auto_doc_ref': True,
        }, True,
    )
    app.add_transform(AutoStructify)
