/*
Utilities for single GPU operation (previously ZeRO sharding)
*/

#ifndef LLMC_ZERO_CUH
#define LLMC_ZERO_CUH

#include <cuda_runtime_api.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>

// defines: fcloseCheck, fwriteCheck
#include "utils.h"

// ----------------------------------------------------------------------------
// Single GPU configuration
typedef struct {
    int process_rank;      // Always 0 in single GPU
    int num_processes;     // Always 1 in single GPU
    int local_device_idx;  // Always 0 in single GPU
} MultiGpuConfig;

// Offset and size of a tensor
typedef struct {
    ptrdiff_t offset;
    size_t size;
} ShardInfo;

// Initialize config for single GPU operation
MultiGpuConfig multi_gpu_config_init(int num_processes, int process_rank, int gpus_per_node, char* server_ip, char* fs_path, char* init_method) {
    // Ignore multi-GPU parameters and just use GPU 0
    cudaCheck(cudaSetDevice(0));
    MultiGpuConfig result;
    result.process_rank = 0;
    result.num_processes = 1;
    result.local_device_idx = 0;
    return result;
}

// No-op in single GPU mode
void multi_gpu_config_free(MultiGpuConfig* config) {}

// No-op in single GPU mode
void multi_gpu_barrier(const MultiGpuConfig* config) {}

// Get info about tensor - in single GPU mode, always returns full tensor
ShardInfo multi_gpu_get_shard_offset(size_t elements, const MultiGpuConfig* config, int shard_at_stage) {
    return {0, elements};
}

// No-op in single GPU mode - gradients already on single GPU
template<int N>
void multi_gpu_async_reduce_gradient(
        floatX* const (&pointers)[N], const size_t (&pointers_sizes)[N],
        MultiGpuConfig* config, cudaStream_t compute_stream) {}

// printf macro - always prints in single GPU mode
#define printf0(...) printf(__VA_ARGS__)

// No-op in single GPU mode - just return input value
float multi_gpu_cpu_float_sum(float value, MultiGpuConfig* config) {
    return value;
}

#endif

