#!/usr/bin/env bash

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r texlive
fi
rm -rf    ${HOME}/.texlive*
rm -rf    ${HOME}/.texmf
rm -rf    ${HOME}/.cache/texlive
rm -rf    ${HOME}/.cache/texlive*
rm -rf    ${HOME}/.cache/texmf
rm -rf    ${HOME}/.porg/${HOSTNAME}/src/texlive

##hSetup
export VERSION="2022"
mkdir -pv ${HOME}/.porg/${HOSTNAME}/src/texlive/${VERSION}
mkdir -pv ${HOME}/.porg/${HOSTNAME}/opt/texlive/${VERSION}
cp -rfv   texlive.profile ${HOME}/.porg/${HOSTNAME}/src/texlive/${VERSION}
cd        ${HOME}/.porg/${HOSTNAME}/src/texlive/${VERSION}

## Download
wget http://ftp.kddilabs.jp/pub/ctan/systems/texlive/tlnet/install-tl-unx.tar.gz
wget http://ftp.kddilabs.jp/pub/ctan/systems/texlive/tlnet/install-tl-unx.tar.gz.sha256
tar -zxvf install-tl-unx.tar.gz
cd install-tl-*/

## Install
sed -i -e "4a TEXMFSYSVAR    ${HOME}/.porg/${HOSTNAME}/opt/texlive/${VERSION}/texmf-var"    ../texlive.profile
sed -i -e "4a TEXMFSYSCONFIG ${HOME}/.porg/${HOSTNAME}/opt/texlive/${VERSION}/texmf-config" ../texlive.profile
sed -i -e "4a TEXMFLOCAL     ${HOME}/.porg/${HOSTNAME}/opt/texlive/texmf-local"             ../texlive.profile
sed -i -e "4a TEXMFHOME      ${HOME}/.cache/texlive/${VERSION}/texmf"                       ../texlive.profile
sed -i -e "4a TEXMFVAR       ${HOME}/.cache/texlive/${VERSION}/texmf-var"                   ../texlive.profile
sed -i -e "4a TEXMFCONFIG    ${HOME}/.cache/texlive/${VERSION}/texmf-config"                ../texlive.profile
sed -i -e "4a TEXDIR         ${HOME}/.porg/${HOSTNAME}/opt/texlive/${VERSION}"              ../texlive.profile
porg -lp  texlive-${VERSION} "./install-tl --profile=../texlive.profile"
for file in $(find ${HOME}/.porg/${HOSTNAME}/opt/texlive/${VERSION}/bin/x86_64-linux/ -type f); do
  porg -lp+ texlive-${VERSION} "ln -sfv $file ${HOME}/.porg/${HOSTNAME}/usr/bin"
done
for filelink in $(find ${HOME}/.porg/${HOSTNAME}/opt/texlive/${VERSION}/bin/x86_64-linux/ -type l); do
  srcname=$(readlink -f $filelink)
  dstname=${HOME}/.porg/${HOSTNAME}/usr/bin/$(basename $filelink)
  porg -lp+ texlive-${VERSION} "ln -sfv $srcname $dstname"
done

## Check
porg texlive
cd ${HOME}

