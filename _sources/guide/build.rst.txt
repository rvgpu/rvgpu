RVGPU 构建和使用
=======================

1. 构建RVGPU
#######################

1.1 初始化仓库
***********************

为了方便管理仓库，此项目使用git submodule来管理，所以只需要访问rvgpu顶层仓库就可以通过submodule来
克隆项目的所有子仓库。
::

    git clone https://gitee.com/rvgpu/rvgpu.git


接下来使用如下命令来初始化仓库：
::

    git submodule init  
    git submodule update

可以查看所有子模块的分支全部切换到了开发分支上：
::
  
   zac@st-ubuntu:~/git/tmp/rvgpu$ git submodule foreach git branch 
   Entering 'docs'
   * main
   Entering 'qemu'
   * rvgpu
   Entering 'rvgpu-cmodel'
   * main
   Entering 'rvgpu-llvm'
   * rvgpu
   Entering 'rvgpu-mesa'
   * rvgpu
   Entering 'tools'
   * main

1.2 如何运行
***********************
目前v0.1版本C模型已经完成，可以独立运行,如下命令可以运行cmodel的测试用例:

在ubuntu23.04系统上运行，安装依赖环境:
::

    sudo apt install gcc-riscv64-linux-gnu g++-riscv64-linux-gnu

编译C模型：
::

    cd rvgpu-cmodel
    mkdir build; cd build
    cmake ../ 
    make -j32

运行测试用例：
::

    make test

2. 使用源码编译第三方库
#########################
在开发过程中，往往需要编译构建第三方库，下面的列表是构建第三方仓库的参考文档：

.. toctree::
   :maxdepth: 1

   build_vulkan_demos
