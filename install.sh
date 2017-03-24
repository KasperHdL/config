#!/bin/bash
# Installs all needed for current setup

#goto home
cd

#Setup yaourt
echo "installing yaourt"
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..
rm -rf yaourt package-query
echo "completed installing yaourt"

echo "installing xclip"
yaourt -S xclip --noconfirm

echo "installing i3"
#install i3 and deps
yaourt -S i3-gaps i3blocks-gaps-git --noconfirm

echo "cloning config files"
#git config
git clone https://github.com/KasperHdL/config
mv config/* .config/
rm -rf config

echo "installing vim"
#install vim
yaourt -S vim --noconfirm

echo "cloning vim config"
#git vim config and init vim submodules
git clone https://github.com/KasperHdL/vim
mv vim .vim
ln -s .vim/vimrc .vimrc

echo "initing vim submodules"
cd .vim
git submodule update --init -recursive
cd bundle/YouCompleteMe
./install.py --all

echo "Finished Installing Vim"
cd

echo "installing gitkraken spotify playerctl"
yaourt -S gitkraken spotify playerctl --noconfirm


echo "installing vivaldi"
yaourt -S vivaldi
#install unity
echo "installing unity"
yaourt -S unity-editor




echo "installing zsh"
#Zsh
yaourt -S zsh --noconfirm
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "--------------"
echo "--------------"
echo "Zsh needs to be set as standard for your user! and Zshrc needs to point to the correct ohmyzsh(unless username is kaholi)! run: chsh -s /bin/zsh"

