#!/bin/bash
set -e

ROOT="$(git rev-parse --show-toplevel)"

if (( $# <= 1 )); then
    echo "Illegal number of arguments"
elif (( $# == 2 )); then
    $1 ${ROOT}/include/$2.hpp
    $1 ${ROOT}/src/$2.cpp
elif (( $# == 3 )); then
    $1 ${ROOT}/include/$2.hpp ${ROOT}/include/$3.hpp
    $1 ${ROOT}/src/$2.cpp ${ROOT}/src/$3.cpp
fi

