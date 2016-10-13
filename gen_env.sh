#!/bin/sh

svn_sdcc="svn://svn.code.sf.net/p/sdcc/code/trunk/sdcc"
git_stm8flash="https://github.com/vdudouyt/stm8flash"
git_src_test="https://github.com/vdudouyt/sdcc-examples-stm8.git"

command -v git >/dev/null 2>&1 || { echo "I require git but it's not installed.  Aborting." >&2; exit 1; }
command -v svn >/dev/null 2>&1 || { echo "I require svn but it's not installed.  Aborting." >&2; exit 1; }

if [ ! -e ./example_src_stm8 ]; then
	echo "==============================="
	echo "||   Clone example src stm8  ||"
	echo "==============================="
	git clone ${git_src_test} example_src_stm8
else
	echo "example_src_stm8 folder exist, don't clone it."
fi

if [ ! -e ./stm8flash ]; then
	echo "==============================="
	echo "||       Clone stm8flash     ||"
	echo "==============================="
	git clone ${git_stm8flash} stm8flash
else
	echo "stm8flash folder exist, don't clone it."
fi

if [ ! -e ./sdcc ]; then
	echo "==============================="
	echo "||       Clone sdcc repo     ||"
	echo "==============================="
	git clone ${svn_sdcc} sdcc
else
	echo "sdcc folder exist, don't clone it."
fi

#line feed
echo ""
echo ""

echo "-----To compile stm8flash-----"
echo "$ cd stm8flash"
echo "$ make"
echo ""
echo ""
echo "-----To compile and install sdcc-----"
echo "$ cd sdcc"
echo "$ ./configure"
echo "$ make"
echo "$ sudo make install"
echo ""
echo "HAVE FUN :)"

exit 0
