#!/bin/bash -x

CWD=${PWD}
BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT=$(dirname ${BASE})

DEVELOP='False'
while getopts ":d" opt; do
    case $opt in
    d)
      DEVELOP='True'
      ;;
    *)
      usage
      exit
      ;;
    esac
done

if [ ! $(command -v pipenv) ] ; then
    source ${BASE}/pyenv.sh
fi
cd ${ROOT}

# Install if not in develop mode
if [ ${DEVELOP} == 'False' ]; then
  make install
else
  make develop
fi

cd ${CWD}
