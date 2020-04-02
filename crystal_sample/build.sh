#!/usr/bin/env bash

src_file="lib.cr"
lib_name="lib"

compile_cmd=$(crystal build --cross-compile $src_file -o $lib_name)
# Patch compile command to produce a shared library
compile_cmd="${compile_cmd/-rdynamic/-rdynamic -shared}"
# Patch compile command to emmit *.so file
compile_cmd="${compile_cmd/-o \'${lib_name}\'/-o ${lib_name}.so}"

echo "$compile_cmd"
eval "$compile_cmd"



