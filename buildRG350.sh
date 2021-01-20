#!/bin/bash

$GIT_BRANCH = "5408576f2a86bde0139a5f4d3b7297c7598cc921"

# remove old build
rm -rf devilutionX
# clone devilutionX
git clone https://github.com/diasurgical/devilutionX.git
cd devilutionX
# git version 1.1.0 of devilutionX. 
# Patches are compatible with this version.
git checkout $GIT_BRANCH
git apply ../patches/make-game-longer.patch
# Not sure why this is needed in v1.1.0
cp Packaging/resources/icon.png Packaging/resources/Diablo_32.png
Packaging/OpenDingux/build.sh rg350
