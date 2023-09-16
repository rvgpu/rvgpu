.. rvgpu documentation master file, created by
   sphinx-quickstart on Tue May 23 14:44:14 2023.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

RVGPU
==============================

我们基于RISC-V的指令集实现一个开源的GPU，并且将实现vulkan接口，这个项目我们暂时将其命名为RVGPU，取名RISC-V GPU之意。

RVGPU仓库包含如下的子项目和目录：
::

    .
    ├── docs                用于存放文档
    ├── tools               用于存放一些开发工具
    ├── rvgpu-mesa          基于Mesa3D实现的支持RVGPU的vulkan驱动
    ├── rvgpu-llvm          基于LLVM实现的RVGPU指令编译器
    ├── rvgpu-cmodel        实现RVGPU的指令集仿真和架构仿真的算法模型（CModel），实现行为级别建模
    ├── kmd                 [TODO] 基于DRM实现的RVGPU的内核态驱动
    ├── qemu                [TODO] QEMU + RVGPU cmode (PCIe device)的虚拟环境
    └── rvgpu-hw            [TODO] RVGPU的硬件实现

使用手册
=================================
.. toctree::
   :maxdepth: 1

   guide/build

开发文档
=================================
.. toctree::
   :maxdepth: 1

   develop/rvgpu/command_stream
   develop/mesa/environment

参考资料
=================================
.. toctree::
   :maxdepth: 1

   docsref/docsref
