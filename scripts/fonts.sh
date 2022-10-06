#!/usr/bin/env bash

## fontconfig
rm    -rfv $HOME/.fontconfig
rm    -rfv $HOME/.cache/fontconfig

## zip
rm    -rfv $HOME/.local/share/fonts
mkdir -pv  $HOME/.local/share/fonts/zip
cd         $HOME/.local/share/fonts/zip
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Noto+Sans
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Noto+Sans+JP
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Noto+Serif+JP
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Roboto
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Roboto+Condensed
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Roboto+Mono
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Roboto+Slab
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=RocknRoll+One
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Reggae+One
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Yusei+Magic
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Kaisei+Tokumin
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Potta+One
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=DotGothic16
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Hachi+Maru+Pop
wget --no-check-certificate --content-disposition https://fonts.google.com/download?family=Train+One
# wget --content-disposition https://ja.osdn.net/downloads/users/8/8637/genshingothic-20150607.zip
wget --no-check-certificate --content-disposition https://github.com/tomokuni/Myrica/raw/master/product/Myrica.zip
for f in *.zip; do 
    unzip -q -d "../${f%*.zip}" "$f"; 
done

## git
cd        $HOME/.local/share/fonts

git clone --verbose https://github.com/adobe-fonts/source-serif.git
git clone --verbose https://github.com/adobe-fonts/source-sans.git
git clone --verbose https://github.com/adobe-fonts/source-code-pro.git
git clone --verbose https://github.com/adobe-fonts/source-han-serif.git
git clone --verbose https://github.com/adobe-fonts/source-han-sans.git
git clone --verbose https://github.com/adobe-fonts/source-han-mono.git
git clone --verbose https://github.com/googlefonts/noto-emoji.git
git clone --verbose https://github.com/microsoft/cascadia-code.git
git clone --verbose https://github.com/edihbrandon/RictyDiminished.git
git clone --verbose https://github.com/tonsky/FiraCode.git
git clone --verbose https://github.com/ryanoasis/nerd-fonts.git
git clone --verbose https://github.com/macchaberrycream/RictyDiminished-Nerd-Fonts.git

## svn
#svn export https://github.com/ryanoasis/nerd-fonts/branches/master/patched-fonts/CascadiaCode
#svn export https://github.com/ryanoasis/nerd-fonts/branches/master/patched-fonts/FiraMono
#svn export https://github.com/ryanoasis/nerd-fonts/branches/master/patched-fonts/FiraCode

## Check
fc-cache -fv
fc-list

