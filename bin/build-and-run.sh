#! /bin/bash

# This script encapsulates bundling a build script using esbuild.
# esbuild is fast and supports importing TypeScript files.

set -e

echo "Building & running ${@}"
script_path=$1
echo "Building script ${script_path}"
esbuild "${script_path}" --bundle --platform=node\
 --external:esbuild\
 --target=node14\
 --outfile="dist/${script_path}"
echo "Running" "dist/${script_path}" "${@:2}"
node "dist/${script_path}" "${@:2}"
