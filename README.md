# Personal Appimages that aren't available in packages

I need to use Asana, Franz and OneNote, but most package managers don't have the packages. Luckily I just install the Appimages.

## Installation

copy contents to App folder in home
> git clone https://github.com/JustinGuese/asana-onenote-franz-appimages.git ~/Apps
> cd ~Apps

unzip asana
> unzip Asana.zip

Create matching permissions
> chmod +x *.AppImage

You might have to edit Desktop files to match your home folder structure.
Then copy desktop files to gnome 
> cp *.desktop ~/.local/share/applications 

---

## Imwheel Mouse shitty wheel

The mouswheel is fucked, install imwheel and run shitty imwheel.sh to adjust
> sudo pacman -S imwheel
> chmod +x ./imwheel.sh
> ./imwheel.sh

---

## Backup and restore packages

Backup - repository
back up the list of currently installed packages from the standard repositories:
Code: [Select]
> pacman -Qqen > pkglist-repo.txt

Backup foreign packages - AUR
back up the list of currently installed packages from the AUR:
Code: [Select]
> pacman -Qqem > pkglist-aur.txt



On the other/new machine:
just do a quick standard installation of Manjaro from a recent ISO on the other machine and then use these two files to have pacman do the work for you.


Do pending updates first in the new installation!
Then restore using the following two commands.

Reinstall from list - repository:
have pacman reinstall all those packages you had installed on the other machine:
Code: [Select]
> sudo su
then run:
Code: [Select]
> for x in $(cat pkglist-repo.txt); do pacman -S --needed $x; done

This here was the original command given, but it did not work. Still don't know why.
> sudo pacman -S --needed $(< pkglist-repo.txt)

Reinstall from list - AUR:
have yaourt reinstall all those extra packages you had:
Code: [Select]
> yay -S --needed --noconfirm $(< pkglist-aur.txt)
