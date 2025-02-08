#pragma once

#include "cpu/decode_gif.h"
#include "cpu/decode_image.h"
#include "cpu/decode_jpeg.h"
#include "cpu/decode_png.h"
#include "cpu/decode_webp.h"
#include "cpu/encode_jpeg.h"
#include "cpu/encode_png.h"
#include "cpu/read_write_file.h"

#ifdef WITH_HIP
#include "hip/encode_decode_jpegs_hip.h"
#endif
#ifdef WITH_CUDA
#include "cuda/encode_decode_jpegs_cuda.h"
#endif
