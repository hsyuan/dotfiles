#!/bin/bash

set -e -u -o pipefail
set -o posix
set -x

main() {
  PROJECT_NAME=$1
  CMAKE_FILE='CMakeLists.txt'

  if [ -f ${CMAKE_FILE} ]; then
    printf "WARNING: ${CMAKE_FILE} already exists, are you sure you want to create it? (y/N) :" 
    read ans
    if [ "y" != "$ans" ]; then
      exit 2
    fi
  fi

  # Empty the current file (if any exists)
  echo "" > ${CMAKE_FILE}
  echo "cmake_minimum_required(VERSION 3.6)" >> ${CMAKE_FILE}
  echo "project(${PROJECT_NAME})" >> ${CMAKE_FILE}
  
  echo "set(CMAKE_CXX_STANDARD 11)" >> ${CMAKE_FILE}
  echo "set(SOURCE_FILES " >> ${CMAKE_FILE}
  find . -not -ipath '*cmake*' -and -not -ipath '*build*' -and \( -name '*.c' -or -name '*.cc' -or -name '*.cpp' \)>> ${CMAKE_FILE}
  echo ")" >> ${CMAKE_FILE}
  
  echo "include_directories(" >> ${CMAKE_FILE}
  find . -name 'include' >> ${CMAKE_FILE}
  echo ")" >> ${CMAKE_FILE}
  
  echo 'add_executable(gpdb ${SOURCE_FILES})' >> ${CMAKE_FILE}
}

main "$@"
