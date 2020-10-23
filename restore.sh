#!/bin/bash
sudo pacman -S --needed --noconfirm $(< pkglist-repo.txt)
yay -S --needed --noconfirm $(< pkglist-aur.txt)
