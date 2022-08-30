#!/usr/bin/env bash

##
## Flatpak
## https://flatpak.org/
## https://flathub.org/
##

## Remove
flatpak uninstall --assumeyes com.github.tchx84.Flatseal
flatpak uninstall --assumeyes org.gnu.emacs
flatpak uninstall --assumeyes org.vim.Vim
flatpak uninstall --assumeyes io.neovim.nvim
flatpak uninstall --assumeyes com.visualstudio.code
flatpak uninstall --assumeyes org.apache.netbeans
flatpak uninstall --assumeyes org.eclipse.Java
flatpak uninstall --assumeyes com.jetbrains.PyCharm-Community
flatpak uninstall --assumeyes com.unity.UnityHub
flatpak uninstall --assumeyes io.github.shiftey.Desktop
flatpak uninstall --assumeyes com.axosoft.GitKraken
flatpak uninstall --assumeyes com.raggesilver.BlackBox
flatpak uninstall --assumeyes org.blender.Blender
flatpak uninstall --assumeyes org.freecadweb.FreeCAD
flatpak uninstall --assumeyes org.kicad.KiCad
flatpak uninstall --assumeyes org.gimp.GIMP
flatpak uninstall --assumeyes org.inkscape.Inkscape
flatpak uninstall --assumeyes org.octave.Octave
flatpak uninstall --assumeyes com.github.PintaProject.Pinta
flatpak uninstall --assumeyes org.kde.krita
flatpak uninstall --assumeyes org.audacityteam.Audacity
flatpak uninstall --assumeyes org.kde.kdenlive
flatpak uninstall --assumeyes org.libreoffice.LibreOffice
flatpak uninstall --assumeyes com.obsproject.Studio
flatpak uninstall --assumeyes org.kde.okular
flatpak uninstall --assumeyes com.google.Chrome
flatpak uninstall --assumeyes com.google.ChromeDev
flatpak uninstall --assumeyes com.microsoft.Edge
flatpak uninstall --assumeyes org.mozilla.firefox
flatpak uninstall --assumeyes com.brave.Browser
flatpak uninstall --assumeyes org.chromium.Chromium
flatpak uninstall --assumeyes org.gnome.Epiphany
flatpak uninstall --assumeyes com.github.micahflee.torbrowser-launcher
flatpak uninstall --assumeyes dev.vieb.Vieb
flatpak uninstall --assumeyes org.mozilla.Thunderbird
flatpak uninstall --assumeyes org.gnome.Geary
flatpak uninstall --assumeyes com.slack.Slack
flatpak uninstall --assumeyes com.discordapp.Discord
flatpak uninstall --assumeyes us.zoom.Zoom
flatpak uninstall --assumeyes com.microsoft.Teams
flatpak uninstall --assumeyes org.videolan.VLC
flatpak uninstall --assumeyes com.spotify.Client
flatpak uninstall --assumeyes com.mojang.Minecraft
flatpak uninstall --assumeyes md.obsidian.Obsidian
flatpak uninstall --assumeyes com.github.k4zmu2a.spacecadetpinball
flatpak uninstall --assumeyes org.kde.kmines
flatpak uninstall --assumeyes org.processing.processingide
flatpak uninstall --assumeyes org.gabmus.hydrapaper
flatpak uninstall --assumeyes com.valvesoftware.Steam
flatpak uninstall --assumeyes org.libreoffice.LibreOffice
flatpak uninstall --assumeyes io.gitlab.librewolf-community
flatpak uninstall --assumeyes org.contourterminal.Contour
flatpak uninstall --assumeyes org.wezfurlong.wezterm
flatpak uninstall --assumeyes com.github.corna.Vivado
flatpak uninstall --assumeyes com.google.AndroidStudio
flatpak uninstall --assumeyes com.sublimetext.three
flatpak uninstall --assumeyes io.atom.Atom
flatpak uninstall --assumeyes io.brackets.Brackets
flatpak uninstall --assumeyes io.qt.QtCreator
flatpak uninstall --assumeyes com.agateau.PixelWheels
flatpak uninstall --assumeyes com.anydesk.Anydesk
flatpak uninstall --assumeyes com.ktechpit.wonderwall
flatpak uninstall --assumeyes dev.boxi.Boxi
flatpak uninstall --assumeyes io.github.f3d_app.f3d
flatpak uninstall --assumeyes io.github.shiiion.primehack
flatpak uninstall --assumeyes net.devolutions.RDM
flatpak uninstall --assumeyes net.meshlab.MeshLab
flatpak uninstall --assumeyes org.geogebra.GeoGebra
flatpak uninstall --assumeyes org.kde.krdc

flatpak uninstall --assumeyes --unused

flatpak remote-delete flathub
flatpak remote-delete flathub-beta
flatpak remote-delete elementary
flatpak remote-delete kdeapps
flatpak remotes

## Setup
export GPG_TTY=$(tty)
flatpak remote-add --if-not-exists flathub      https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak remote-add --if-not-exists elementary   https://flatpak.elementary.io/repo.flatpakrepo
flatpak remote-add --if-not-exists kdeapps      https://distribute.kde.org/kdeapps.flatpakrepo
flatpak remotes


## Update
flatpak repair --assumeyes
flatpak update --assumeyes

## Install
flatpak install --assumeyes flathub com.github.tchx84.Flatseal
flatpak install --assumeyes flathub io.neovim.nvim
flatpak install --assumeyes flathub com.visualstudio.code
# flatpak install --assumeyes flathub org.eclipse.Java
flatpak install --assumeyes flathub io.github.shiftey.Desktop
flatpak install --assumeyes flathub org.blender.Blender
flatpak install --assumeyes flathub org.freecadweb.FreeCAD
flatpak install --assumeyes flathub org.kicad.KiCad
flatpak install --assumeyes flathub org.gimp.GIMP
flatpak install --assumeyes flathub org.inkscape.Inkscape
flatpak install --assumeyes flathub org.octave.Octave
flatpak install --assumeyes flathub org.libreoffice.LibreOffice
# flatpak install --assumeyes flathub org.kde.okular
flatpak install --assumeyes flathub com.google.Chrome
flatpak install --assumeyes flathub org.mozilla.firefox
flatpak install --assumeyes flathub org.mozilla.Thunderbird
flatpak install --assumeyes flathub com.microsoft.Edge
flatpak install --assumeyes flathub com.discordapp.Discord
flatpak install --assumeyes flathub com.slack.Slack
flatpak install --assumeyes flathub us.zoom.Zoom
flatpak install --assumeyes flathub com.microsoft.Teams
flatpak install --assumeyes flathub org.videolan.VLC
# flatpak install --assumeyes flathub com.spotify.Client
# flatpak install --assumeyes flathub com.mojang.Minecraft
# flatpak install --assumeyes flathub com.github.k4zmu2a.spacecadetpinball
# flatpak install --assumeyes flathub org.kde.kmines
# flatpak install --assumeyes flathub org.processing.processingide
flatpak install --assumeyes flathub org.wezfurlong.wezterm
flatpak install --assumeyes flathub io.github.f3d_app.f3d
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

