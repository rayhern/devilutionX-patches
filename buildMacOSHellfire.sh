#!/bin/bash
# remove old build
rm -rf devilutionX
# clone devilutionX
git clone https://github.com/diasurgical/devilutionX.git
cd devilutionX
# git version 1.1.0 of devilutionX. 
# Patches are compatible with this version.
#git checkout 5408576f2a86bde0139a5f4d3b7297c7598cc921
#git apply ../patches/add-ip-phonebook.patch
cd build/
cmake -DBINARY_RELEASE=ON -DDEBUG=OFF -DPREFILL_PLAYER_NAME=ON ..
cmake --build . -j $(sysctl -n hw.physicalcpu)