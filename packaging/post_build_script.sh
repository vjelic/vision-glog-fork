#!/bin/bash
set -euxo pipefail

if [ -n "${CUDA_HOME:-}" ]; then
    LD_LIBRARY_PATH="/usr/local/lib:${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}"
fi

python packaging/wheel/relocate.py

pip install torchvision-extra-decoders
