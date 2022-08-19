#!/usr/bin/env bash

##
## Flatpak
## https://flatpak.org/
## https://flathub.org/
##


## Setup
flatpak remote-add --user --if-not-exists flathub      https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --user --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak remote-add --user --if-not-exists elementary   https://flatpak.elementary.io/repo.flatpakrepo
flatpak remote-add --user --if-not-exists kdeapps      https://distribute.kde.org/kdeapps.flatpakrepo
flatpak remotes


## Update
flatpak update --user --assumeyes

## Install
flatpak install --user --assumeyes flathub com.github.tchx84.Flatseal
flatpak install --user --assumeyes flathub org.gnu.emacs
flatpak install --user --assumeyes flathub org.vim.Vim
flatpak install --user --assumeyes flathub io.neovim.nvim
flatpak override --user --env=XDG_CONFIG_HOME=$HOME/.config io.neovim.nvim
flatpak install --user --assumeyes flathub com.visualstudio.code
flatpak install --user --assumeyes flathub org.apache.netbeans
flatpak install --user --assumeyes flathub org.eclipse.Java
flatpak install --user --assumeyes flathub com.jetbrains.PyCharm-Community
flatpak install --user --assumeyes flathub com.unity.UnityHub
flatpak install --user --assumeyes flathub io.github.shiftey.Desktop
flatpak install --user --assumeyes flathub com.axosoft.GitKraken
flatpak install --user --assumeyes flathub com.raggesilver.BlackBox
flatpak install --user --assumeyes flathub org.blender.Blender
flatpak install --user --assumeyes flathub org.freecadweb.FreeCAD
flatpak install --user --assumeyes flathub org.kicad.KiCad
flatpak install --user --assumeyes flathub org.gimp.GIMP
flatpak install --user --assumeyes flathub org.inkscape.Inkscape
flatpak install --user --assumeyes flathub org.octave.Octave
flatpak install --user --assumeyes flathub com.github.PintaProject.Pinta
flatpak install --user --assumeyes flathub org.kde.krita
flatpak install --user --assumeyes flathub org.audacityteam.Audacity
flatpak install --user --assumeyes flathub org.kde.kdenlive
flatpak install --user --assumeyes flathub org.libreoffice.LibreOffice
flatpak install --user --assumeyes flathub com.obsproject.Studio
flatpak install --user --assumeyes flathub org.kde.okular
flatpak install --user --assumeyes flathub com.google.Chrome
flatpak install --user --assumeyes flathub com.google.ChromeDev
flatpak install --user --assumeyes flathub com.microsoft.Edge
flatpak install --user --assumeyes flathub org.mozilla.firefox
flatpak install --user --assumeyes flathub com.brave.Browser
flatpak install --user --assumeyes flathub org.chromium.Chromium
flatpak install --user --assumeyes flathub org.gnome.Epiphany
flatpak install --user --assumeyes flathub com.github.micahflee.torbrowser-launcher
flatpak install --user --assumeyes flathub dev.vieb.Vieb
flatpak install --user --assumeyes flathub org.mozilla.Thunderbird
flatpak install --user --assumeyes flathub org.gnome.Geary
flatpak install --user --assumeyes flathub com.slack.Slack
flatpak install --user --assumeyes flathub com.discordapp.Discord
flatpak install --user --assumeyes flathub us.zoom.Zoom
flatpak install --user --assumeyes flathub com.microsoft.Teams
flatpak install --user --assumeyes flathub org.videolan.VLC
flatpak install --user --assumeyes flathub com.spotify.Client
flatpak install --user --assumeyes flathub com.mojang.Minecraft
flatpak install --user --assumeyes flathub md.obsidian.Obsidian
flatpak install --user --assumeyes flathub com.github.k4zmu2a.spacecadetpinball
flatpak install --user --assumeyes flathub org.kde.kmines
flatpak install --user --assumeyes flathub org.processing.processingide
flatpak install --user --assumeyes flathub org.gabmus.hydrapaper
flatpak install --user --assumeyes flathub com.valvesoftware.Steam
flatpak install --user --assumeyes flathub org.libreoffice.LibreOffice
flatpak install --user --assumeyes flathub io.gitlab.librewolf-community
flatpak install --user --assumeyes flathub org.contourterminal.Contour
flatpak install --user --assumeyes flathub org.wezfurlong.wezterm
flatpak override --user --env=XDG_CONFIG_HOME=$HOME/.config org.wezfurlong.wezterm
# flatpak install --user --assumeyes flathub com.github.corna.Vivado
# flatpak install --user --assumeyes flathub com.google.AndroidStudio
# flatpak install --user --assumeyes flathub com.sublimetext.three
# flatpak install --user --assumeyes flathub io.atom.Atom
# flatpak install --user --assumeyes flathub io.brackets.Brackets
# flatpak install --user --assumeyes flathub io.qt.QtCreator

