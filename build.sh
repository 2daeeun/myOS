#!/bin/sh

# build 디렉토리가 없으면 만들기
if [ ! -d "build" ]; then
	mkdir build
	echo "build 디렉토리를 만들었습니다."
else
	echo "build 디렉토리가 이미 있습니다."
fi

make && qemu-system-i386 -fda build/main_floopy.img
