# 关于RVGPU
我们将基于RISC-V的指令集实现一个开源的GPU，并且将实现vulkan接口，这个项目我们将其命名为RVGPU，取名RISC-V GPU之意。

访问 [项目主页](http://10.100.101.58:10000/)

RVGPU仓库包含如下的子项目和目录：
```
.  
├── docs                用于存放文档  
├── tools               用于存放一些工具和脚本  
├── rvgpu-mesa          基于Mesa3D实现的支持RVGPU的vulkan驱动
├── rvgpu-llvm          基于LLVM实现的RVGPU指令编译器  
├── rvgpu-cmodel        实现RVGPU的指令集仿真和架构仿真的算法模型（CModel），实现行为级别建模
└── rvgpu-hw            使用Chisel实现的RVGPU硬件 
```

# 快速构建项目
在tools目录下实现了快速编译脚本:
```
./tools/build/build.sh
```
