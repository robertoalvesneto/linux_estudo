#! /bin/bash

https://www.if-not-true-then-false.com/2015/fedora-nvidia-guide/
NVIDIA=""
STEAM="https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
STEAM="https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-steam-35&arch=x86_64"

sudo dnf install $STEAM

sudo dnf install steam