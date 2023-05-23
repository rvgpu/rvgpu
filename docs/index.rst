.. rvgpu documentation master file, created by
   sphinx-quickstart on Tue May 23 14:44:14 2023.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

项目介绍
==============================

我们基于RISC-V的指令集实现一个开源的GPU，并且将实现vulkan接口，这个项目我们将其命名为RVGPU，取名RISC-V GPU之意。

RVGPU仓库包含如下的子项目和目录：
::

    .
    ├── docs                用于存放文档
    ├── rvgpu-mesa          基于Mesa3D实现的支持RVGPU的vulkan驱动
    ├── rvgpu-llvm          基于LLVM实现的RVGPU指令编译器
    ├── rvgpu-cmodel        实现RVGPU的指令集仿真和架构仿真的算法模型（CModel），实现行为级别建模
    └── rvgpu-hw            使用Chisel实现的RVGPU硬件


使用手册
=================================
.. toctree::
   :maxdepth: 1

   guide/build

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
