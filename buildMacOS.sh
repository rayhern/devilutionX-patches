#!/bin/bash
# remove old build
rm -rf devilutionX
# clone devilutionX
git clone https://github.com/diasurgical/devilutionX.git
cd devilutionX
# git version 1.1.0 of devilutionX. Patches are compatible with this version.
git checkout 5408576f2a86bde0139a5f4d3b7297c7598cc921
clear
echo "Applying patches..."
# Add patch to add phonebook to diablo.ini file.
git apply ../patches/qol-patches.patch
echo "Building..."
mkdir build/
cd build/
cmake -DBINARY_RELEASE=ON -DDEBUG=OFF -DPREFILL_PLAYER_NAME=ON ..
cmake --build . -j $(sysctl -n hw.physicalcpu)
