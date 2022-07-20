# cpp-simple-boilerplate-gen
Its simple cpp boilerplate genrator

# Setup

First u need change permissions for this script.

```zsh
chmod 755 ./boilerplait.sh  
```

#### For me it best to put it as an alias 


```zsh

alias gen-cpp="YOUR_PATH_TO_SCRIPT"

```
# How it works

This script generates basic struture for projects in cpp .This is what the basic structure looks like.

```text
buid/
includes/
src/
  main.cpp
CMakeLists.txt
```
The number of folders or their name can be easily changed in the script.

# A word about CMakeList config 

The project name is set from the name we gave the folder 

```cmake

# only for cmake --version >= 3.5.1
cmake_minimum_required(VERSION 3.5.1)

# project name
project(name)

# creates the variable EXEC and sets it to hello
set(EXEC main)

# set the C++11 standard
set(CMAKE_CXX_STANDARD 11)

# I../includes
include_directories(includes)

# puts all .cpp files inside src to the SOURCES variable
file(GLOB SOURCES src/*.cpp)

# compiles the files defined by SOURCES to generante the executable defined by EXEC
add_executable(${EXEC} ${SOURCES})
```


