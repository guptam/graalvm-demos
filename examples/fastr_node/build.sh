#!/bin/bash

set -e

# Resolve the location of this script
source="${BASH_SOURCE[0]}"
while [ -h "$source" ] ; do
  prev_source="$source"
  source="$(readlink "$source")";
  if [[ "$source" != /* ]]; then
    # if the link was relative, it was relative to where it came from
    dir="$( cd -P "$( dirname "$prev_source" )" && pwd )"
    source="$dir/$source"
  fi
done
dir="$( cd -P "$( dirname "$source" )" && pwd )"

: ${GRAALVM_DIR?"GRAALVM_DIR must point to a GraalVM image"}

# Install expressjs
echo "Running npm install"
${GRAALVM_DIR}/bin/npm --prefix ${dir} install ${dir}
