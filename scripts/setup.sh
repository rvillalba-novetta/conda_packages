#!/bin/bash

set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.."; pwd)"

# Add channels to conda
if ! conda config --get channels | grep conda-forge; then
	conda config --add channels conda-forge
fi
conda config --add channels $ROOT_DIR/pkgs/channel/linux-64
