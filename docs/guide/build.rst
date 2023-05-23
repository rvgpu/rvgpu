RVGPU 构建和使用
=======================

1. 构建
#######################

1.1 编译
***********************

此项目使用git submodule来管理，为了使镜像仓库保持一致，如果使用gitee的地址需要将url更新为gitee上面的仓库地址，可以使用如下命令：
::

    ./scripts/updata_submodule_urls.sh

接下来使用如下命令来初始化仓库：
::

    git clone https://gitee.com/sietium-research/rvgpu.git
    git submodule init  
    git submodule update

scripts目录下提供了一个编译脚本用来快速编译：
::

    ./scripts/build.sh

此脚本将编译vulkan驱动和CModel，并且将编译生成的目标文件安装到`${PWD}/install`路径下。

1.2 运行vulkan 
***********************

运行vulkan demo时需要设置vulkan ICD环境，可以通过如下命令来设置`VK_ICD_FILENAMES`环境变量：

::

    export VK_ICD_FILENAMES=${PWD}/install/share/vulkan/icd.d/rvgpu_icd.x86_64.json
