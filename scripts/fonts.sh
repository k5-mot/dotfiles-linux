#!/usr/bin/env bash

set -x

## Initialize
rm    -rf $HOME/.fontconfig
rm    -rf $HOME/.cache/fontconfig
rm    -rf $HOME/.local/share/fonts

## Download
mkdir -p  $HOME/.local/share/fonts/tarball
cd        $HOME/.local/share/fonts/tarball
wget --no-check-certificate https://github.com/google/fonts/archive/main.tar.gz                      -O GoogleFonts.tar.gz
wget --no-check-certificate https://github.com/tonsky/FiraCode/archive/master.tar.gz                 -O FiraCode.tar.gz
wget --no-check-certificate https://github.com/ryanoasis/nerd-fonts/archive/master.tar.gz            -O NerdFonts.tar.gz
wget --no-check-certificate https://github.com/powerline/fonts/archive/master.tar.gz                 -O Powerline.tar.gz
wget --no-check-certificate https://github.com/microsoft/cascadia-code/archive/main.tar.gz           -O CascadiaCode.tar.gz
# wget --no-check-certificate https://github.com/adobe-fonts/source-serif/archive/release.tar.gz       -O AdobeSourceSerif.tar.gz
# wget --no-check-certificate https://github.com/adobe-fonts/source-sans/archive/release.tar.gz        -O AdobeSourceSans.tar.gz
# wget --no-check-certificate https://github.com/adobe-fonts/source-code-pro/archive/release.tar.gz    -O AdobeSourceCodePro.tar.gz
# wget --no-check-certificate https://github.com/adobe-fonts/source-han-serif/archive/release.tar.gz   -O AdobeSourceHanSerif.tar.gz
# wget --no-check-certificate https://github.com/adobe-fonts/source-han-sans/archive/release.tar.gz    -O AdobeSourceHanSans.tar.gz
# wget --no-check-certificate https://github.com/adobe-fonts/source-han-mono/archive/release.tar.gz    -O AdobeSourceHanMono.tar.gz
wget --no-check-certificate https://github.com/adobe-fonts/source-han-code-jp/archive/release.tar.gz -O AdobeSourceHanCodeJP.tar.gz
wget --no-check-certificate https://github.com/edihbrandon/RictyDiminished/archive/master.tar.gz     -O RictyDiminished.tar.gz
wget --no-check-certificate https://github.com/macchaberrycream/RictyDiminished-Nerd-Font/archive/master.tar.gz -O RictyDiminishedNerdFont.tar.gz

## Extract
cd         $HOME/.local/share/fonts
for tarball in tarball/*.tar.gz; do 
    mkdir -p $(basename $tarball .tar.gz)
    tar -xf $tarball -C $(basename $tarball .tar.gz) --strip-components 1
done

## Update
fc-cache -fv
fc-list

