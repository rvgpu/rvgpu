#! /usr/bin/env bash

function build_env
{
    mkdir -p build
    mkdir -p install
}


function build_mesa
{
    mesa_dir=${PWD}/rvgpu-mesa
    build_dir=${PWD}/build/rvgpu-mesa
    install_dir=${PWD}/install

    if [ -f rvgpu-mesa/README.md ]; then
        if [ ! -d ${build_dir} ]; then
            meson ${build_dir} rvgpu-mesa -Dprefix=${install_dir} -Dgallium-drivers= -Dvulkan-drivers=rvgpu -Dplatforms=x11 -Dglx=disabled -Dbuildtype=debug
        fi
        ninja -C ${build_dir} install
    else
        echo "rvgpu-mesa is a illegal repos under this project"
    fi
}

build_env

build_mesa
