#!/bin/bash
# remove old build
rm -rf devilutionX
# clone devilutionX
git clone https://github.com/diasurgical/devilutionX.git
cd devilutionX
# git version 1.1.0 of devilutionX. Patches are compatible with this version.
git checkout 5408576f2a86bde0139a5f4d3b7297c7598cc921
# Add patch to add phonebook to diablo.ini file.
git apply ../patches/fix-ip-phonebook.patch
# Add more players to multiplayer games
git apply ../patches/more-players.patch
# Allow blacksmith to have a bigger spending limit, and more premium items.
git apply ../patches/qol-blacksmith-more-premium.patch
# Increase the max amount of gold in each stack type: small, medium, large.
git apply ../patches/increase-gold-stack-limit.patch
# Patch to highlight items on ground.
git apply ../patches/highlight-items-floor.patch
cd build/
cmake -DBINARY_RELEASE=ON -DDEBUG=OFF -DPREFILL_PLAYER_NAME=ON ..
cmake --build . -j $(sysctl -n hw.physicalcpu)
