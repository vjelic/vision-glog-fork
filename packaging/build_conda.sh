#!/bin/bash
set -ex

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. "$script_dir/pkg_helpers.bash"

export BUILD_TYPE=conda
setup_env
export SOURCE_ROOT_DIR="$PWD"
setup_conda_pytorch_constraint
if [[ "$CU_VERSION" == rocm* ]]; then
    setup_conda_rocm_constraint
    # export ROCM_CHANNEL="-c $fill_in"
else
    setup_conda_cudatoolkit_constraint
    setup_visual_studio_constraint
    export CUDATOOLKIT_CHANNEL="-c nvidia"
fi
setup_junit_results_folder

conda build $CUDATOOLKIT_CHANNEL $ROCM_CHANNEL $CONDA_CHANNEL_FLAGS --no-anaconda-upload --python "$PYTHON_VERSION" packaging/torchvision
