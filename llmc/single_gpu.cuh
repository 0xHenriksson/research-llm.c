#ifndef LLMC_SINGLE_GPU_CUH
#define LLMC_SINGLE_GPU_CUH

#include <cuda_runtime_api.h>
#include "utils.h"


// simple config for single GPU operation
typedef struct {
    int device_id; // GPU device id to use
} SingleGpuConfig;

// Init config for jetson
SingleGpuConfig single_gpu_init() {
    SingleGpuConfig config;
    config.device_id = 0;
    cudaCheck(cudaSetDevice(config.device_id));
    
    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, config.device_id);
    
    // Set L1 cache preference for transformer workloads
    cudaCheck(cudaDeviceSetCacheConfig(cudaFuncCachePreferL1));
    
    return config;
}

// simple printf wrapper
#define printf0(...) printf(__VA_ARGS__)

// get tensor info - always returns full tensor on single GPU
typedef struct {
    size_t offset;
    size_t size;
} TensorInfo;

TensorInfo get_tensor_info(size_t elements) {
    return {0, elements};
}

// no-op barrier for single gpu
inline void device_barrier() {}

#endif