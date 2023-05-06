#! /usr/bin/env bash

function build_env
{
    mkdir -p build
    mkdir -p install
}


function build_mesa
{
    mesa_dir=${PWD}/rvgpu-mesa
    mesa_build_dir=${PWD}/build/rvgpu-mesa
    mesa_install_dir=${PWD}/install

    if [ -f rvgpu-mesa/README.md ]; then
        if [ ! -d ${mesa_build_dir} ]; then
            meson ${mesa_build_dir} rvgpu-mesa -Dprefix=${mesa_install_dir} -Dgallium-drivers= -Dvulkan-drivers=rvgpu -Dplatforms=x11 -Dglx=disabled -Dbuildtype=debug
        fi
        ninja -C ${mesa_build_dir} install
    else
        echo "rvgpu-mesa is a illegal repos under this project"
    fi
}

function build_rvgsim
{
    rvgsim_dir=${PWD}/rvgpu-cmodel
    rvgsim_build_dir=${PWD}/build/rvgpu-cmodel
    rvgsim_install_dir=${PWD}/install
    if [ -f rvgpu-cmodel/README.md ]; then
        if [ ! -d ${rvgsim_build_dir} ]; then
            mkdir -p ${rvgsim_build_dir}
            cmake -B ${rvgsim_build_dir} ${rvgsim_dir} -DCMAKE_INSTALL_PREFIX=${rvgsim_install_dir} -DCMAKE_BUILD_TYPE=debug
        fi
        cmake --build ${rvgsim_build_dir}
        cmake --install ${rvgsim_build_dir}
    else
        echo "rvgpu-cmodel is a illegal repos under this project"
    fi
}

build_env

build_mesa
build_rvgsim
