#!/usr/bin/env bash

##
## Flatpak
## https://flatpak.org/
## https://flathub.org/
##

## Remove
sudo flatpak uninstall --assumeyes com.github.tchx84.Flatseal
sudo flatpak uninstall --assumeyes org.gnu.emacs
sudo flatpak uninstall --assumeyes org.vim.Vim
sudo flatpak uninstall --assumeyes io.neovim.nvim
sudo flatpak uninstall --assumeyes com.visualstudio.code
sudo flatpak uninstall --assumeyes org.apache.netbeans
sudo flatpak uninstall --assumeyes org.eclipse.Java
sudo flatpak uninstall --assumeyes com.jetbrains.PyCharm-Community
sudo flatpak uninstall --assumeyes com.unity.UnityHub
sudo flatpak uninstall --assumeyes io.github.shiftey.Desktop
sudo flatpak uninstall --assumeyes com.axosoft.GitKraken
sudo flatpak uninstall --assumeyes com.raggesilver.BlackBox
sudo flatpak uninstall --assumeyes org.blender.Blender
sudo flatpak uninstall --assumeyes org.freecadweb.FreeCAD
sudo flatpak uninstall --assumeyes org.kicad.KiCad
sudo flatpak uninstall --assumeyes org.gimp.GIMP
sudo flatpak uninstall --assumeyes org.inkscape.Inkscape
sudo flatpak uninstall --assumeyes org.octave.Octave
sudo flatpak uninstall --assumeyes com.github.PintaProject.Pinta
sudo flatpak uninstall --assumeyes org.kde.krita
sudo flatpak uninstall --assumeyes org.audacityteam.Audacity
sudo flatpak uninstall --assumeyes org.kde.kdenlive
sudo flatpak uninstall --assumeyes org.libreoffice.LibreOffice
sudo flatpak uninstall --assumeyes com.obsproject.Studio
sudo flatpak uninstall --assumeyes org.kde.okular
sudo flatpak uninstall --assumeyes com.google.Chrome
sudo flatpak uninstall --assumeyes com.google.ChromeDev
sudo flatpak uninstall --assumeyes com.microsoft.Edge
sudo flatpak uninstall --assumeyes org.mozilla.firefox
sudo flatpak uninstall --assumeyes com.brave.Browser
sudo flatpak uninstall --assumeyes org.chromium.Chromium
sudo flatpak uninstall --assumeyes org.gnome.Epiphany
sudo flatpak uninstall --assumeyes com.github.micahflee.torbrowser-launcher
sudo flatpak uninstall --assumeyes dev.vieb.Vieb
sudo flatpak uninstall --assumeyes org.mozilla.Thunderbird
sudo flatpak uninstall --assumeyes org.gnome.Geary
sudo flatpak uninstall --assumeyes com.slack.Slack
sudo flatpak uninstall --assumeyes com.discordapp.Discord
sudo flatpak uninstall --assumeyes us.zoom.Zoom
sudo flatpak uninstall --assumeyes com.microsoft.Teams
sudo flatpak uninstall --assumeyes org.videolan.VLC
sudo flatpak uninstall --assumeyes com.spotify.Client
sudo flatpak uninstall --assumeyes com.mojang.Minecraft
sudo flatpak uninstall --assumeyes md.obsidian.Obsidian
sudo flatpak uninstall --assumeyes com.github.k4zmu2a.spacecadetpinball
sudo flatpak uninstall --assumeyes org.kde.kmines
sudo flatpak uninstall --assumeyes org.processing.processingide
sudo flatpak uninstall --assumeyes org.gabmus.hydrapaper
sudo flatpak uninstall --assumeyes com.valvesoftware.Steam
sudo flatpak uninstall --assumeyes org.libreoffice.LibreOffice
sudo flatpak uninstall --assumeyes io.gitlab.librewolf-community
sudo flatpak uninstall --assumeyes org.contourterminal.Contour
sudo flatpak uninstall --assumeyes org.wezfurlong.wezterm
sudo flatpak uninstall --assumeyes com.github.corna.Vivado
sudo flatpak uninstall --assumeyes com.google.AndroidStudio
sudo flatpak uninstall --assumeyes com.sublimetext.three
sudo flatpak uninstall --assumeyes io.atom.Atom
sudo flatpak uninstall --assumeyes io.brackets.Brackets
sudo flatpak uninstall --assumeyes io.qt.QtCreator
sudo flatpak uninstall --assumeyes com.agateau.PixelWheels
sudo flatpak uninstall --assumeyes com.anydesk.Anydesk
sudo flatpak uninstall --assumeyes com.ktechpit.wonderwall
sudo flatpak uninstall --assumeyes dev.boxi.Boxi
sudo flatpak uninstall --assumeyes io.github.f3d_app.f3d
sudo flatpak uninstall --assumeyes io.github.shiiion.primehack
sudo flatpak uninstall --assumeyes net.devolutions.RDM
sudo flatpak uninstall --assumeyes net.meshlab.MeshLab
sudo flatpak uninstall --assumeyes org.geogebra.GeoGebra
sudo flatpak uninstall --assumeyes org.kde.krdc

sudo flatpak uninstall --assumeyes --unused

sudo flatpak remote-delete flathub
sudo flatpak remote-delete flathub-beta
sudo flatpak remote-delete elementary
sudo flatpak remote-delete kdeapps
sudo flatpak remotes

## Setup
sudo flatpak remote-add --if-not-exists flathub      https://dl.flathub.org/repo/flathub.flatpakrepo
# sudo flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
# sudo flatpak remote-add --if-not-exists elementary   https://flatpak.elementary.io/repo.flatpakrepo
# sudo flatpak remote-add --if-not-exists kdeapps      https://distribute.kde.org/kdeapps.flatpakrepo
sudo flatpak remotes


## Update
sudo flatpak repair
sudo flatpak update --assumeyes

## Install
sudo flatpak install --assumeyes flathub com.github.tchx84.Flatseal
sudo flatpak install --assumeyes flathub io.neovim.nvim
sudo flatpak install --assumeyes flathub com.visualstudio.code
sudo flatpak install --assumeyes flathub io.github.shiftey.Desktop
sudo flatpak install --assumeyes flathub org.blender.Blender
sudo flatpak install --assumeyes flathub org.freecadweb.FreeCAD
sudo flatpak install --assumeyes flathub org.kicad.KiCad
sudo flatpak install --assumeyes flathub org.gimp.GIMP
sudo flatpak install --assumeyes flathub org.inkscape.Inkscape
sudo flatpak install --assumeyes flathub org.octave.Octave
sudo flatpak install --assumeyes flathub org.libreoffice.LibreOffice
sudo flatpak install --assumeyes flathub com.google.Chrome
sudo flatpak install --assumeyes flathub org.mozilla.firefox
sudo flatpak install --assumeyes flathub org.mozilla.Thunderbird
sudo flatpak install --assumeyes flathub com.microsoft.Edge
sudo flatpak install --assumeyes flathub com.discordapp.Discord
sudo flatpak install --assumeyes flathub com.slack.Slack
sudo flatpak install --assumeyes flathub us.zoom.Zoom
sudo flatpak install --assumeyes flathub com.microsoft.Teams
sudo flatpak install --assumeyes flathub org.videolan.VLC
sudo flatpak install --assumeyes flathub org.wezfurlong.wezterm
sudo flatpak install --assumeyes flathub io.github.f3d_app.f3d
# flatpak install --assumeyes flathub org.eclipse.Java
# flatpak install --assumeyes flathub org.kde.okular
# flatpak install --assumeyes flathub com.spotify.Client
# flatpak install --assumeyes flathub com.mojang.Minecraft
# flatpak install --assumeyes flathub com.github.k4zmu2a.spacecadetpinball
# flatpak install --assumeyes flathub org.kde.kmines
# flatpak install --assumeyes flathub org.processing.processingide
# flatpak install --assumeyes flathub com.google.ChromeDev
# flatpak install --assumeyes flathub net.meshlab.MeshLab
# flatpak install --user --assumeyes flathub org.gnu.emacs
# flatpak install --user --assumeyes flathub org.vim.Vim
# flatpak install --user --assumeyes flathub org.apache.netbeans
# flatpak install --user --assumeyes flathub com.jetbrains.PyCharm-Community
# flatpak install --user --assumeyes flathub com.unity.UnityHub
# flatpak install --user --assumeyes flathub com.axosoft.GitKraken
# flatpak install --user --assumeyes flathub com.raggesilver.BlackBox
# flatpak install --user --assumeyes flathub com.github.PintaProject.Pinta
# flatpak install --user --assumeyes flathub org.kde.krita
# flatpak install --user --assumeyes flathub org.audacityteam.Audacity
# flatpak install --user --assumeyes flathub org.kde.kdenlive
# flatpak install --user --assumeyes flathub com.obsproject.Studio
# flatpak install --user --assumeyes flathub com.microsoft.Edge
# flatpak install --user --assumeyes flathub com.brave.Browser
# flatpak install --user --assumeyes flathub org.chromium.Chromium
# flatpak install --user --assumeyes flathub org.gnome.Epiphany
# flatpak install --user --assumeyes flathub com.github.micahflee.torbrowser-launcher
# flatpak install --user --assumeyes flathub dev.vieb.Vieb
# flatpak install --user --assumeyes flathub org.gnome.Geary
# flatpak install --user --assumeyes flathub md.obsidian.Obsidian
# flatpak install --user --assumeyes flathub org.gabmus.hydrapaper
# flatpak install --user --assumeyes flathub com.valvesoftware.Steam
# flatpak install --user --assumeyes flathub org.libreoffice.LibreOffice
# flatpak install --user --assumeyes flathub io.gitlab.librewolf-community
# flatpak install --user --assumeyes flathub org.contourterminal.Contour
# flatpak install --user --assumeyes flathub com.github.corna.Vivado
# flatpak install --user --assumeyes flathub com.google.AndroidStudio
# flatpak install --user --assumeyes flathub com.sublimetext.three
# flatpak install --user --assumeyes flathub io.atom.Atom
# flatpak install --user --assumeyes flathub io.brackets.Brackets
# flatpak install --user --assumeyes flathub io.qt.QtCreator
# flatpak install --user --assumeyes flathub com.agateau.PixelWheels
# flatpak install --user --assumeyes flathub com.anydesk.Anydesk
# flatpak install --user --assumeyes flathub com.ktechpit.wonderwall
# flatpak install --user --assumeyes flathub dev.boxi.Boxi
# flatpak install --user --assumeyes flathub io.github.shiiion.primehack
# flatpak install --user --assumeyes flathub net.devolutions.RDM
# flatpak install --user --assumeyes flathub org.geogebra.GeoGebra
# flatpak install --user --assumeyes flathub org.kde.krdc

flatpak override --user org.wezfurlong.wezterm --env="WEZTERM_CONFIG_FILE=$HOME/.config/wezterm/wezterm.lua"
flatpak override --user io.neovim.nvim         --env="XDG_CONFIG_HOME=$HOME/.config"

