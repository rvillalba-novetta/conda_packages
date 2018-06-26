#!/bin/bash

set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.."; pwd)"

# Add channel to conda
conda config --add channels $ROOT_DIR/pkgs/channel/linux-64