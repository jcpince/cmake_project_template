# CMake project template

This is a small working examples to start with a new project or change the build system of an existing one.

## Build commands:
 1. mkdir Build
 2. cd build
 3. cmake -DTARGET_PLATFORM=titi ..
 4. make VERBOSE=1
 5. ./DEV

## NOTES:
 - This sample shows how to set flags, compiler, linker if necessary (see CMAKE_C_LINK_EXECUTABLE) and manage several targets offering configurations.
