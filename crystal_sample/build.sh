#!/usr/bin/env bash

src_file="lib.cr"
lib_name="lib"

cc -fPIC -c "crystal_library_runtime.c"

compile_cmd=$(crystal build --cross-compile $src_file -o $lib_name)
# Patch compile command to produce a shared library
compile_cmd="${compile_cmd/-rdynamic/-rdynamic -shared}"
# Patch compile command to include crystal_library_runtime.o
compile_cmd="${compile_cmd/cc \'${lib_name}.o\'/cc ${lib_name}.o crystal_library_runtime.o}"
# Patch compile command to emmit *.so file
compile_cmd="${compile_cmd/-o \'${lib_name}\'/-o ${lib_name}.so}"

echo "$compile_cmd"
eval "$compile_cmd"



