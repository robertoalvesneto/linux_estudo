#! /bin/bash

# DIRECTORIES
DIR_PROGRAMS_DOWNLOAD="$HOME/Downloads/programs"

# REPOSITORIES
REPO_RPMFUSION_FREE="https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
REPO_RPMFUSION_NOFREE="https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# PROGRAMS URL:
URL_LIBREOFFICE="https://download.documentfoundation.org/libreoffice/stable/7.3.0/rpm/x86_64/LibreOffice_7.3.0_Linux_x86-64_rpm.tar.gz"
URL_LIBREOFFICE_LANG_PTBR_PACK="https://download.documentfoundation.org/libreoffice/stable/7.3.0/rpm/x86_64/LibreOffice_7.3.0_Linux_x86-64_rpm_langpack_pt-BR.tar.gz"
URL_LIBREOFFICE_HELP_PTBR_PACK="https://download.documentfoundation.org/libreoffice/stable/7.3.0/rpm/x86_64/LibreOffice_7.3.0_Linux_x86-64_rpm_helppack_pt-BR.tar.gz"
URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
URL_VSCODE="https://az764295.vo.msecnd.net/stable/d6ee99e4c045a6716e5c653d7da8e9ae6f5a8b03/code-1.64.1-1644255919.el7.x86_64.rpm"

# PROGRAMS FLATPACK:
FLATPACK_SIMPLENOTE="flatpak install flathub com.simplenote.Simplenote"
FLATPACK_SPOTIFY="com.spotify.Client"
FLATPACK_DISCORD="com.discordapp.Discord"
FLATPACK_TEAMS="flatpak install flathub com.github.IsmaelMartinez.teams_for_linux"

add_repositories () {
    sudo dnf install "$REPO_RPMFUSION_FREE"
    sudo dnf install "$REPO_RPMFUSION_NOFREE"
}

update () {
    sudo dnf upgrade -y
}

light_install () {
    sudo dnf install tilix -y
    sudo dnf install htop -y
    sudo dnf install git -y
    sudo dnf install vim -y
    sudo dnf install curl -y
    sudo dnf install wget -y
}

install_url_clone () {
    mkdir "$DIR_PROGRAMS_DOWNLOAD"
    wget "$URL_LIBREOFFICE" -P "$DIR_PROGRAMS_DOWNLOAD"
    wget "$URL_LIBREOFFICE_LANG_PTBR_PACK" -P "$DIR_PROGRAMS_DOWNLOAD"
    wget "$URL_LIBREOFFICE_HELP_PTBR_PACK" -P "$DIR_PROGRAMS_DOWNLOAD"
    wget "$URL_CHROME" -P "$DIR_PROGRAMS_DOWNLOAD"
    wget "$URL_VSCODE" -P "$DIR_PROGRAMS_DOWNLOAD"
}

install_flatpack() {
    sudo dnf install -y flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub "$FLATPACK_SIMPLENOTE"
    flatpak install flathub "$FLATPACK_$SPOTIFY"
    flatpak install flathub "$FLATPACK_$DISCORD"
    flatpak install flathub "$FLATPACK_TEAMS"
}

heavy_install () {
    sudo dnf install simplescreenrecorder -y
    sudo dnf install sqlitebrowser -y
    heavy_install_url_clone
    heavy_install_flatpack
}

TODO:
DIVIDIR DOIS TIPOS DE INSTALAÇÃO
RODAR UPDATE
CLONAR URLS PARA PASTA
INSTALAR CLONES
INSTALAR ZSHELL E TEMA

CRIAR ARQUIVO DE PERSONALIZAÇÃO DO GNOME
CRIAR INSTALAR DE JOGOS