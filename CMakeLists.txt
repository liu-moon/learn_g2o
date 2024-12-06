cmake_minimum_required(VERSION 3.20)
project(learn_g2o)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_BUILD_TYPE "Debug")
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g")

add_subdirectory(src bin)