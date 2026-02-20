#!/bin/bash
set -euo pipefail

mkdir -p build
cd build

cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_PREFIX_PATH="${PREFIX}" \
    -DCMAKE_CXX_FLAGS_RELEASE="-O3 -DNDEBUG -funroll-loops"

make -j"${CPU_COUNT}"

# Install binary
install -m 755 dart "${PREFIX}/bin/dart"
