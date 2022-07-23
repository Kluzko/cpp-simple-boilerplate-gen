#!/bin/bash


read -p "Enter a folder/project name: " folder_name





#if folder exist and its empty ask to delete it
if [ -d "$folder_name" ] && [ -z "$(ls -A $folder_name)" ]; then
  echo "Folder exists and is empty"
  read -p "Do you want to delete it? [y/n]: " delete_folder
  if [ "$delete_folder" == "y" ]; then
    rm -rf $folder_name
    echo "Folder deleted"
  else
    echo "Folder not deleted"
    exit 1
  fi
fi

# if folder exist and it is not empty ask again for another folder name
if [ -d "$folder_name" ] && [ "$(ls -A $folder_name)" ]; then
  echo "Folder already exists and it is not empty"
  read -p "Enter the diffrent folder name: " folder_name
fi

# check if folder name is valid
if ! [[ $folder_name =~ ^[a-zA-Z0-9_-]+$ ]]
then
    echo "Folder name isnt valid"
    exit 1
fi



# Define folders list

DIRS=('build' 'src' 'includes')

# Make root folder 
mkdir $folder_name

cd $folder_name
# add subfolders to root

for dir in "${DIRS[@]}"; do
    mkdir "$dir"
done



# Create CMakeLists config file
touch CMakeLists.txt

# Save config to CMakeLists

cat << EOF > CMakeLists.txt
# only for cmake --version >= 3.5.1
cmake_minimum_required(VERSION 3.5.1)

# project name
project($folder_name)

# creates the variable EXEC and sets it to hello
set(EXEC main)

# set the C++11 standard
set(CMAKE_CXX_STANDARD 11)

# I../includes
include_directories(includes)

# puts all .cpp files inside src to the SOURCES variable
file(GLOB SOURCES src/*.cpp)

# compiles the files defined by SOURCES to generante the executable defined by EXEC
add_executable(\${EXEC} \${SOURCES})

EOF


# Create main.cpp file with basic structure
touch src/main.cpp


cat << EOF > src/main.cpp
#include <iostream>

int main(){
    
    return 0;
}
EOF



