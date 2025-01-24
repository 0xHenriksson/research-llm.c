# Notes

# 1. Hardware Optimization

Need to make sure the framework is optimized for the NVIDIA Jetson Orin Nano 8gb Dev Kit. This means removing multi-GPU support, optimizing for ARM, and overall reducing the amount of overhead in the framework. This framework will use minimal dependencies, building from first principles whenever possible. This library is intended to be AI component of an edge medical hardware device, so it needs to be robust, memory-safe, and full-proof as possible.
Both training and inference routines need to use novel, but intentional methods to improve performance.

Possible Research Implementations / Integrations:
- Flash attention
- Memory In a Flash
- DeepSeek R1-style kv cache reduction
- Mixture of Depths
- ThunderKittens to take advantage of warp tiling