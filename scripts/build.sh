#! /usr/bin/env bash

function build_env
{
    mkdir -p build
    mkdir -p install
}


function build_mesa
{
    echo "####################################################"
    echo "# start build mesa"
    mesa_dir=${PWD}/rvgpu-mesa
    mesa_build_dir=${PWD}/build/rvgpu-mesa
    mesa_install_dir=${PWD}/install

    if [ -f rvgpu-mesa/README.md ]; then
        if [ ! -d ${mesa_build_dir} ]; then
            meson ${mesa_build_dir} rvgpu-mesa -Dprefix=${mesa_install_dir} -Dgallium-drivers= -Dvulkan-drivers=rvgpu -Dplatforms=x11 -Dglx=disabled -Dbuildtype=debug
        fi
        ninja -C ${mesa_build_dir} install

        if [ $? -ne 0 ]; then
            echo "build rvgpu-mesa failed and exit"
            exit -1
        fi
    else
        echo "rvgpu-mesa is a illegal repos under this project"
    fi
    echo "# build mesa done"
    echo "####################################################"
}

function build_rvgsim
{
    echo "####################################################"
    echo "# start build rvgsim"
    rvgsim_dir=${PWD}/rvgpu-cmodel
    rvgsim_build_dir=${PWD}/build/rvgpu-cmodel
    rvgsim_install_dir=${PWD}/install
    if [ -f rvgpu-cmodel/README.md ]; then
        if [ ! -d ${rvgsim_build_dir} ]; then
            mkdir -p ${rvgsim_build_dir}
            cmake -B ${rvgsim_build_dir} ${rvgsim_dir} -DCMAKE_INSTALL_PREFIX=${rvgsim_install_dir} -DCMAKE_BUILD_TYPE=debug
        fi
        cmake --build ${rvgsim_build_dir}
        if [ $? -ne 0 ]; then
            echo "build rvgpu-sim failed and exit"
            exit -1
        fi

        cmake --install ${rvgsim_build_dir}
    else
        echo "rvgpu-cmodel is a illegal repos under this project"
    fi
    echo "# build rvgsim done"
    echo "####################################################"
}

build_env

build_mesa
build_rvgsim
