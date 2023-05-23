# 关于RVGPU
我们将基于RISC-V的指令集实现一个开源的GPU，并且将实现vulkan接口，这个项目我们将其命名为RVGPU，取名RISC-V GPU之意。

访问 [项目主页](http://10.100.101.58:10000/)

RVGPU仓库包含如下的子项目和目录：
```
.  
├── docs                用于存放文档  
├── scripts             用于存放一些工具和脚本  
├── rvgpu-mesa          基于Mesa3D实现的支持RVGPU的vulkan驱动
├── rvgpu-llvm          基于LLVM实现的RVGPU指令编译器  
├── rvgpu-cmodel        实现RVGPU的指令集仿真和架构仿真的算法模型（CModel），实现行为级别建模
└── rvgpu-hw            使用Chisel实现的RVGPU硬件 
```

# 如何构建
此项目使用git submodule来管理，为了使镜像仓库保持一致，如果使用gitee的地址需要将url更新为gitee上面的仓库地址，可以使用如下命令：
```
./scripts/updata_submodule_urls.sh
```
接下来使用如下命令来初始化仓库：
```
git clone https://gitee.com/sietium-research/rvgpu.git
git submodule init
git submodule update
```

scripts目录下提供了一个编译脚本用来快速编译：
```
./scripts/build.sh
```

此脚本将编译vulkan驱动和CModel，并且将编译生成的目标文件安装到`${PWD}/install`路径下。

# 运行vulkan 
运行vulkan demo时需要设置vulkan ICD环境，可以通过如下命令来设置`VK_ICD_FILENAMES`环境变量：

```
export VK_ICD_FILENAMES=${PWD}/install/share/vulkan/icd.d/rvgpu_icd.x86_64.json
```
