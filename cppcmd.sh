#!/bin/bash
set -e

ROOT="$(git rev-parse --show-toplevel)"

$1 ${ROOT}/include/$2.hpp
$1 ${ROOT}/src/$2.cpp

