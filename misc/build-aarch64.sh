#!/bin/sh

DENO_OS=$(deno eval "console.log(Deno.build.os)")
FLAGS=

case $DENO_OS in
linux)
  FLAGS="-target aarch64-linux"
  ;;
darwin)
  FLAGS="-target aarch64-macos -F /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
  ;;
esac

ARCH=aarch64 CC="zig cc ${FLAGS}" make clean dist
