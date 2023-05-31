#!/usr/bin/env bash
set -ex

if [[ "$CONDA_BUILD_VARIANT" == rocm ]]; then
    # remove pyproject.toml
    rm $SRC_DIR/pyproject.toml

    export ROCM_HOME=$PREFIX
    export CMAKE_PREFIX_PATH=$PREFIX
    export TORCHVISION_INCLUDE="${PREFIX}/include/"
    export USE_NINJA=0
    export FORCE_CUDA=1
    python setup.py install --single-version-externally-managed --record=record.txt
else
    python setup.py install --single-version-externally-managed --record=record.txt
fi
