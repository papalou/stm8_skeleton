#!/bin/sh

git_stm8flash="https://github.com/vdudouyt/stm8flash"
git_src_test="https://github.com/vdudouyt/sdcc-examples-stm8.git"

echo "All stm8 source are compiled with 'sdcc' please install it manualy..."
sleep 2

if [ ! -e ./example_src_stm8 ]; then
	echo "==============================="
	echo "||   Clone example src stm8  ||"
	echo "==============================="
	git clone ${git_src_test} ./example_src_stm8
else
	echo "example src for stm8 present don't clone..."
fi

if [ ! -e ./stm8flash ]; then
	echo "==============================="
	echo "||       Clone stm8flash     ||"
	echo "==============================="
	git clone ${git_stm8flash} ./stm8flash
	echo "Build stm8flash..."
	cd stm8flash
	make
	cd ..
else
	echo "stm8flash exist, don't clone it."
fi

exit 0
