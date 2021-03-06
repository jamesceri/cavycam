#!/bin/bash

function setup_toolchain() {
    echo "##############################"
    echo "#### Setting up toolchain ####"
    echo "##############################"
    mkdir -p rpi
    pushd rpi
    if [ ! -f "gcc-linaro-arm-linux-gnueabihf-raspbian-x64.tar.gz" ]; then
        wget -nv https://www.dropbox.com/s/pwgtvpvlakjqpi7/gcc-linaro-arm-linux-gnueabihf-raspbian-x64.tar.gz?dl=0 -O gcc-linaro-arm-linux-gnueabihf-raspbian-x64.tar.gz
        tar -zxf gcc-linaro-arm-linux-gnueabihf-raspbian-x64.tar.gz
    fi
    popd
    export PATH=$PATH:$PWD/rpi/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
    echo $PATH
    arm-linux-gnueabihf-gcc -v
}

function build_wiringpi() {
    echo "##############################"
    echo "#### wiringpi             ####"
    echo "##############################"

    if [ ! -f "wiringPi.tar.gz" ]; then
        wget -nv https://www.dropbox.com/s/yvhrs9n345ppdvs/wiringPi.tar.gz?dl=0 -O wiringPi.tar.gz
        tar -zxf wiringPi.tar.gz
    fi

    pushd wiringPi
    ./build
    echo $PWD
    sudo rm /usr/lib/libwiringPi.so*
    sudo rm /usr/local/lib/libwiringPi.so*
    sudo cp wiringPi/libwiringPi.so.2.44 /usr/local/lib/
    sudo ln -s /usr/local/lib/libwiringPi.so.2.44 /usr/local/lib/libwiringPi.so
    ls -l /usr/local/lib/libwiring*
    if [ $? -ne 0 ]; then
        echo "Failed to build wiringPi"
        popd
        exit -1
    fi
    popd
}

function autoconfig_tools() {
    echo "##############################"
    echo "#### aclocal              ####"
    echo "##############################"
    aclocal
    if [ $? -ne 0 ]; then
        echo "Failed aclocal"
        exit -1
    fi

    echo "##############################"
    echo "#### autoconf             ####"
    echo "##############################"
    autoconf
    if [ $? -ne 0 ]; then
        echo "Failed autoconf"
        exit -1
    fi

    echo "##############################"
    echo "#### automake             ####"
    echo "##############################"
    automake --add-missing
    if [ $? -ne 0 ]; then
        echo "Failed automake --add-missing"
        exit -1
    fi

    mkdir -p $BUILD_PACKAGE_NAME
    pushd $BUILD_PACKAGE_NAME

    CC=arm-linux-gnueabihf-gcc ../configure --host=arm-linux-gnueabihf-gcc 

    if [ $? -ne 0 ]; then
        echo "Failed ../configure"
        exit -1
    fi
}

function build_app() {
    echo "##############################"
    echo "#### build_app            ####"
    echo "##############################"
    autoconfig_tools

    make
    if [ $? -ne 0 ]; then
        echo "Failed make"
        exit -1
    fi

    file $APPLICATION_NAME
    popd
    tar -zcf $BUILD_PACKAGE_NAME.tgz $BUILD_PACKAGE_NAME
}

function cleanup() {
    echo "##############################"
    echo "#### cleanup              ####"
    echo "##############################"
    rm -rf autom4te.cache
    rm Makefile.in aclocal.m4 compile configure depcomp install-sh missing
    rm -rf $BUILD_PACKAGE_NAME
}

function change_gpp() {
    gpp_path=`which g++`
    gpp_location=`which g++ | sed 's/\(.*\)\/.*/\1/'`
    gpp_orig_version=`ls -l $gpp_path | cut -f2 -d'>' | tr -d ' '`
    echo "gpp_path=$gpp_path"
    echo "gpp_location=$gpp_location"
    echo "gpp_orig_version=$gpp_orig_version"

    sudo rm $gpp_path
    sudo ln -s $PWD/rpi/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-g++ $gpp_path
}
function change_gcc() {
    gcc_path=`which gcc`
    gcc_location=`which gcc | sed 's/\(.*\)\/.*/\1/'`
    gcc_orig_version=`ls -l $gcc_path | cut -f2 -d'>' | tr -d ' '`
    echo "gcc_path=$gcc_path"
    echo "gcc_location=$gcc_location"
    echo "gcc_orig_version=$gcc_orig_version"

    sudo rm $gcc_path
    sudo ln -s $PWD/rpi/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc $gcc_path

    change_gpp
}

function reset_gpp() {
 sudo rm $gpp_path
 sudo ln -s $gpp_orig_version $gpp_path
}

function reset_gcc() {
 sudo rm $gcc_path
 sudo ln -s $gcc_orig_version $gcc_path
 reset_gpp
}

change_gcc
setup_toolchain
build_wiringpi
build_app
reset_gcc
cleanup
