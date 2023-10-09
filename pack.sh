#!/bin/bash

# most of this code from @SomeAspy

#SECTION - SETUP

cd ..
git config --global pull.rebase false
git clone https://github.com/vendicated/vencord
#git clone https://github.com/SomeAspy/ThirdPartyVencordPlugins --recurse-submodules
npm i -g pnpm

#!SECTION
#SECTION - Integrate 3rd-party plugins

#(cd ThirdPartyVencordPlugins || { echo "Filesystem Failure"; exit 1;}
#bash repack.sh)
#mkdir vencord/src/userplugins
#cp -Rf ThirdPartyVencordPlugins/dist/* vencord/src/userplugins/
mv reviewDB vencord/src/userplugins/
#!SECTION
#SECTION - Build Vencord

(cd vencord || { echo "Filesystem Failure"; exit 1;}
pnpm i
pnpm run buildWeb)

#!SECTION
#SECTION - Deploy

cp -Rf vencord/dist/* dist

#!SECTION

echo made by someaspy on Discord - https://github.com/SomeAspy - https://aspy.dev
