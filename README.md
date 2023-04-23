# about rvgpu
rvgpu: Risc-V GPU  
We will implement an open source GPU based on RISC-V, we named this project rvgpu.

rvgpu project contains the following subproject:  
.  
├── docs                documents  
├── scripts             some tools script  
├── rvgpu-mesa          vulkan driver support rvgpu based on mesa3d  
├── rvgpu-llvm          compiler for rvgpu  
├── rvgpu-cmodel        a cmodel that simulate rvgpu architecture and instruction  
└── rvgpu-hw            use chisel implement the rvgpu hardware  

# build
Clone and initialize this project as:  
```
git clone https://gitee.com/sietium-research/rvgpu.git
git submodule init
git submodule updata
```

Then build project use a script:  
```
./scripts/build.sh
```

This script will build vulkan driver and cmodel, and install the target to `${PWD}/install`  

# run vulkan 
Run vulkan demo need to setup `VK_ICD_FILENAMES` environment:  
```
export VK_ICD_FILENAMES=${PWD}/install/share/vulkan/icd.d/rvgpu_icd.x86_64.json
```
