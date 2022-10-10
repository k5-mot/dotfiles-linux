#!/usr/bin/env bash

##
## Flatpak
## https://flatpak.org/
## https://flathub.org/
##

## Remove
flatpak uninstall --user --assumeyes com.github.tchx84.Flatseal
flatpak uninstall --user --assumeyes org.gnu.emacs
flatpak uninstall --user --assumeyes org.vim.Vim
flatpak uninstall --user --assumeyes io.neovim.nvim
flatpak uninstall --user --assumeyes com.visualstudio.code
flatpak uninstall --user --assumeyes org.apache.netbeans
flatpak uninstall --user --assumeyes org.eclipse.Java
flatpak uninstall --user --assumeyes com.jetbrains.PyCharm-Community
flatpak uninstall --user --assumeyes com.unity.UnityHub
flatpak uninstall --user --assumeyes io.github.shiftey.Desktop
flatpak uninstall --user --assumeyes com.axosoft.GitKraken
flatpak uninstall --user --assumeyes com.raggesilver.BlackBox
flatpak uninstall --user --assumeyes org.blender.Blender
flatpak uninstall --user --assumeyes org.freecadweb.FreeCAD
flatpak uninstall --user --assumeyes org.kicad.KiCad
flatpak uninstall --user --assumeyes org.gimp.GIMP
flatpak uninstall --user --assumeyes org.inkscape.Inkscape
flatpak uninstall --user --assumeyes org.octave.Octave
flatpak uninstall --user --assumeyes com.github.PintaProject.Pinta
flatpak uninstall --user --assumeyes org.kde.krita
flatpak uninstall --user --assumeyes org.audacityteam.Audacity
flatpak uninstall --user --assumeyes org.kde.kdenlive
flatpak uninstall --user --assumeyes org.libreoffice.LibreOffice
flatpak uninstall --user --assumeyes com.obsproject.Studio
flatpak uninstall --user --assumeyes org.kde.okular
flatpak uninstall --user --assumeyes com.google.Chrome
flatpak uninstall --user --assumeyes com.google.ChromeDev
flatpak uninstall --user --assumeyes com.microsoft.Edge
flatpak uninstall --user --assumeyes org.mozilla.firefox
flatpak uninstall --user --assumeyes com.brave.Browser
flatpak uninstall --user --assumeyes org.chromium.Chromium
flatpak uninstall --user --assumeyes org.gnome.Epiphany
flatpak uninstall --user --assumeyes com.github.micahflee.torbrowser-launcher
flatpak uninstall --user --assumeyes dev.vieb.Vieb
flatpak uninstall --user --assumeyes org.mozilla.Thunderbird
flatpak uninstall --user --assumeyes org.gnome.Geary
flatpak uninstall --user --assumeyes com.slack.Slack
flatpak uninstall --user --assumeyes com.discordapp.Discord
flatpak uninstall --user --assumeyes us.zoom.Zoom
flatpak uninstall --user --assumeyes com.microsoft.Teams
flatpak uninstall --user --assumeyes org.videolan.VLC
flatpak uninstall --user --assumeyes com.spotify.Client
flatpak uninstall --user --assumeyes com.mojang.Minecraft
flatpak uninstall --user --assumeyes md.obsidian.Obsidian
flatpak uninstall --user --assumeyes com.github.k4zmu2a.spacecadetpinball
flatpak uninstall --user --assumeyes org.kde.kmines
flatpak uninstall --user --assumeyes org.processing.processingide
flatpak uninstall --user --assumeyes org.gabmus.hydrapaper
flatpak uninstall --user --assumeyes com.valvesoftware.Steam
flatpak uninstall --user --assumeyes org.libreoffice.LibreOffice
flatpak uninstall --user --assumeyes io.gitlab.librewolf-community
flatpak uninstall --user --assumeyes org.contourterminal.Contour
flatpak uninstall --user --assumeyes org.wezfurlong.wezterm
flatpak uninstall --user --assumeyes com.github.corna.Vivado
flatpak uninstall --user --assumeyes com.google.AndroidStudio
flatpak uninstall --user --assumeyes com.sublimetext.three
flatpak uninstall --user --assumeyes io.atom.Atom
flatpak uninstall --user --assumeyes io.brackets.Brackets
flatpak uninstall --user --assumeyes io.qt.QtCreator
flatpak uninstall --user --assumeyes com.agateau.PixelWheels
flatpak uninstall --user --assumeyes com.anydesk.Anydesk
flatpak uninstall --user --assumeyes com.ktechpit.wonderwall
flatpak uninstall --user --assumeyes dev.boxi.Boxi
flatpak uninstall --user --assumeyes io.github.f3d_app.f3d
flatpak uninstall --user --assumeyes io.github.shiiion.primehack
flatpak uninstall --user --assumeyes net.devolutions.RDM
flatpak uninstall --user --assumeyes net.meshlab.MeshLab
flatpak uninstall --user --assumeyes org.geogebra.GeoGebra
flatpak uninstall --user --assumeyes org.kde.krdc

flatpak uninstall --user --assumeyes --unused

flatpak remote-delete --user flathub
flatpak remote-delete --user flathub-beta
flatpak remote-delete --user elementary
flatpak remote-delete --user kdeapps
flatpak remotes

## Setup
export GPG_TTY=$(tty)
flatpak remote-add --user --if-not-exists flathub      https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --user --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak remote-add --user --if-not-exists elementary   https://flatpak.elementary.io/repo.flatpakrepo
flatpak remote-add --user --if-not-exists kdeapps      https://distribute.kde.org/kdeapps.flatpakrepo
flatpak remotes


## Update
flatpak repair --user --assumeyes
flatpak update --user --assumeyes

## Install
flatpak install --user --assumeyes flathub com.github.tchx84.Flatseal
flatpak install --user --assumeyes flathub io.neovim.nvim
flatpak install --user --assumeyes flathub com.visualstudio.code
flatpak install --user --assumeyes flathub org.eclipse.Java
flatpak install --user --assumeyes flathub io.github.shiftey.Desktop
flatpak install --user --assumeyes flathub org.blender.Blender
flatpak install --user --assumeyes flathub org.freecadweb.FreeCAD
flatpak install --user --assumeyes flathub org.kicad.KiCad
flatpak install --user --assumeyes flathub org.gimp.GIMP
flatpak install --user --assumeyes flathub org.inkscape.Inkscape
flatpak install --user --assumeyes flathub org.octave.Octave
flatpak install --user --assumeyes flathub org.libreoffice.LibreOffice
flatpak install --user --assumeyes flathub org.kde.okular
flatpak install --user --assumeyes flathub com.google.Chrome
flatpak install --user --assumeyes flathub com.google.ChromeDev
flatpak install --user --assumeyes flathub org.mozilla.firefox
flatpak install --user --assumeyes flathub org.mozilla.Thunderbird
flatpak install --user --assumeyes flathub com.discordapp.Discord
flatpak install --user --assumeyes flathub com.slack.Slack
flatpak install --user --assumeyes flathub us.zoom.Zoom
flatpak install --user --assumeyes flathub com.microsoft.Teams
flatpak install --user --assumeyes flathub org.videolan.VLC
flatpak install --user --assumeyes flathub com.spotify.Client
flatpak install --user --assumeyes flathub com.mojang.Minecraft
flatpak install --user --assumeyes flathub com.github.k4zmu2a.spacecadetpinball
flatpak install --user --assumeyes flathub org.kde.kmines
flatpak install --user --assumeyes flathub org.processing.processingide
flatpak install --user --assumeyes flathub org.wezfurlong.wezterm
flatpak install --user --assumeyes flathub io.github.f3d_app.f3d
flatpak install --user --assumeyes flathub net.meshlab.MeshLab
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

