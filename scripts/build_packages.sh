#!/bin/bash

set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.."; pwd)"

echo 'Usage: pass in path to each package to build or no arguments to build all\n\n'

# Get full list of paths to recipes based on user input
if [[ "$1" ]] ; then
	recipe_list=""
	for arg_path in "$@"; do
		if [[ "$arg_path" = /* ]] ; then
			recipe_list="$recipe_list $arg_path"
		else
			recipe_list="$recipe_list $PWD/$arg_path"
		fi
	done
else
	recipe_list=$(echo $ROOT_DIR/recipes/*)
fi

# Build each project and copy over to channel
for pkg in $recipe_list ; do
    echo "Building $pkg..."
    conda-build $pkg
    pkg_loc=$(conda-build --output $pkg)
    cp $pkg_loc $ROOT_DIR/pkgs/channel/linux-64
done

conda index $ROOT_DIR/pkgs/channel/linux-64