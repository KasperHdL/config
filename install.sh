#!/bin/bash
# Installs all needed for current setup

#goto home
cd

#Setup yay
echo "installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo "completed installing yay"

echo "installing xclip"
yaourt -S xclip --noconfirm

#install i3 and deps
echo "installing i3"
yaourt -S i3-gaps i3blocks-gaps-git i3lock-fancy-git rofi feh compton playerctl --noconfirm

echo "cloning config files"
#git config
mkdir temp
cd temp
git clone https://github.com/KasperHdL/.config

#Install NeoVim

#move config files
mv temp/.config/* .config/
mv temp/.config/.* .config/
rm -rf temp

cd
echo "installing various programs"
yaourt -S firefox
yaourt -S smartgit
yaourt -S spotify
yaourt -S thunderbird
yaourt -S discord
yaourt -S dropbox

#install unity
echo "installing unity"
yaourt -S unity-editor

echo "installing zsh"
#zsh
yaourt -S zsh --noconfirm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

rm .zshrc
ln -s .config/.zshrc .zshrc
ln -s .oh-my-zsh/themes/spaceship.zsh-theme .config spaceship.zsh-theme

echo "--------------"
echo "--------------"
echo "Zshrc needs to point to the correct ohmyzsh(unless username is kaholi) look at .zshrc"

echo "Run chsh -s /bin/zsh"
