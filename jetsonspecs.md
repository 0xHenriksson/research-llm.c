# cpu/memory info
lscpu
cat /proc/meminfo
free -h
Architecture:            aarch64
  CPU op-mode(s):        32-bit, 64-bit
  Byte Order:            Little Endian
CPU(s):                  6
  On-line CPU(s) list:   0-5
Vendor ID:               ARM
  Model name:            Cortex-A78AE
    Model:               1
    Thread(s) per core:  1
    Core(s) per cluster: 3
    Socket(s):           -
    Cluster(s):          2
    Stepping:            r0p1
    CPU max MHz:         1728.0000
    CPU min MHz:         115.2000
    BogoMIPS:            62.50
    Flags:               fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp uscat ilrcpc flagm paca pacg
Caches (sum of all):     
  L1d:                   384 KiB (6 instances)
  L1i:                   384 KiB (6 instances)
  L2:                    1.5 MiB (6 instances)
  L3:                    4 MiB (2 instances)
NUMA:                    
  NUMA node(s):          1
  NUMA node0 CPU(s):     0-5
Vulnerabilities:         
  Gather data sampling:  Not affected
  Itlb multihit:         Not affected
  L1tf:                  Not affected
  Mds:                   Not affected
  Meltdown:              Not affected
  Mmio stale data:       Not affected
  Retbleed:              Not affected
  Spec rstack overflow:  Not affected
  Spec store bypass:     Mitigation; Speculative Store Bypass disabled via prctl
  Spectre v1:            Mitigation; __user pointer sanitization
  Spectre v2:            Mitigation; CSV2, but not BHB
  Srbds:                 Not affected
  Tsx async abort:       Not affected
MemTotal:        7802736 kB
MemFree:         3668508 kB
MemAvailable:    6245596 kB
Buffers:          633812 kB
Cached:          2193460 kB
SwapCached:         1212 kB
Active:          1811360 kB
Inactive:        1090624 kB
Active(anon):      30916 kB
Inactive(anon):   235644 kB
Active(file):    1780444 kB
Inactive(file):   854980 kB
Unevictable:       35392 kB
Mlocked:               0 kB
SwapTotal:       3901344 kB
SwapFree:        3608100 kB
Dirty:                16 kB
Writeback:             0 kB
AnonPages:        108724 kB
Mapped:            86996 kB
Shmem:            156444 kB
KReclaimable:     144568 kB
Slab:             239900 kB
SReclaimable:     144568 kB
SUnreclaim:        95332 kB
KernelStack:        7408 kB
PageTables:        12016 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     7802712 kB
Committed_AS:    2671020 kB
VmallocTotal:   133143592960 kB
VmallocUsed:       58724 kB
VmallocChunk:          0 kB
Percpu:             4080 kB
HardwareCorrupted:     0 kB
AnonHugePages:      6144 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
CmaTotal:         262144 kB
CmaFree:               0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
               total        used        free      shared  buff/cache   available
Mem:           7.4Gi       1.1Gi       3.5Gi       152Mi       2.8Gi       6.0Gi

# gpu specific (for jetson)
nvidia-smi
tegrastats
Sat Jan  4 16:02:58 2025       
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 540.4.0                Driver Version: 540.4.0      CUDA Version: 12.6     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  Orin (nvgpu)                  N/A  | N/A              N/A |                  N/A |
| N/A   N/A  N/A               N/A /  N/A | Not Supported        |     N/A          N/A |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+
                                                                                         
+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
|  No running processes found                                                           |
+---------------------------------------------------------------------------------------+
01-04-2025 16:02:59 RAM 1273/7620MB (lfb 1x4MB) SWAP 286/3810MB (cached 1MB) CPU [0%@1036,0%@1036,1%@1036,0%@1036,0%@729,0%@729] GR3D_FREQ 0% cpu@45.875C soc2@45.843C soc0@44.843C gpu@45.437C tj@46.312C soc1@46.312C VDD_IN 4968mW/4968mW VDD_CPU_GPU_CV 436mW/436mW VDD_SOC 1708mW/1708mW

# compiler/toolchain versions
g++ --version
nvcc --version
g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
Copyright (C) 2021 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2024 NVIDIA Corporation
Built on Wed_Aug_14_10:14:07_PDT_2024
Cuda compilation tools, release 12.6, V12.6.68
Build cuda_12.6.r12.6/compiler.34714021_0

# system architecture
uname -a
getconf LONG_BIT
Linux jetsson 5.15.148-tegra #1 SMP PREEMPT Thu Dec 12 15:37:09 PST 2024 aarch64 aarch64 aarch64 GNU/Linux
64
(alex) 

# Filesystem
df -h
Filesystem       Size  Used Avail Use% Mounted on
/dev/nvme0n1p1   234G  123G  100G  56% /
tmpfs            3.8G   84K  3.8G   1% /dev/shm
tmpfs            1.5G  155M  1.4G  11% /run
tmpfs            5.0M  4.0K  5.0M   1% /run/lock
/dev/mmcblk0p10   63M  110K   63M   1% /boot/efi
tmpfs            762M   92K  762M   1% /run/user/128
tmpfs            762M   80K  762M   1% /run/user/1000

# block devices
lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0          7:0    0     4K  1 loop /snap/bare/5
loop1          7:1    0 174.8M  1 loop /snap/chromium/3008
loop2          7:2    0  68.8M  1 loop /snap/core22/1720
loop3          7:3    0  64.7M  1 loop /snap/cups/1069
loop4          7:4    0 483.3M  1 loop /snap/gnome-42-2204/178
loop5          7:5    0  91.7M  1 loop /snap/gtk-common-themes/1535
loop6          7:6    0  38.6M  1 loop /snap/snapd/23259
loop7          7:7    0    16M  1 loop 
mmcblk0      179:0    0 476.7G  0 disk 
├─mmcblk0p1  179:1    0 475.3G  0 part 
├─mmcblk0p2  179:2    0   128M  0 part 
├─mmcblk0p3  179:3    0   768K  0 part 
├─mmcblk0p4  179:4    0  31.6M  0 part 
├─mmcblk0p5  179:5    0   128M  0 part 
├─mmcblk0p6  179:6    0   768K  0 part 
├─mmcblk0p7  179:7    0  31.6M  0 part 
├─mmcblk0p8  179:8    0    80M  0 part 
├─mmcblk0p9  179:9    0   512K  0 part 
├─mmcblk0p10 179:10   0    64M  0 part /boot/efi
├─mmcblk0p11 179:11   0    80M  0 part 
├─mmcblk0p12 179:12   0   512K  0 part 
├─mmcblk0p13 179:13   0    64M  0 part 
├─mmcblk0p14 179:14   0   400M  0 part 
└─mmcblk0p15 179:15   0 479.5M  0 part 
zram0        252:0    0   635M  0 disk [SWAP]
zram1        252:1    0   635M  0 disk [SWAP]
zram2        252:2    0   635M  0 disk [SWAP]
zram3        252:3    0   635M  0 disk [SWAP]
zram4        252:4    0   635M  0 disk [SWAP]
zram5        252:5    0   635M  0 disk [SWAP]
nvme0n1      259:0    0 238.5G  0 disk 
└─nvme0n1p1  259:1    0 238.5G  0 part /