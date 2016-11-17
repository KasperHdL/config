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

#Zsh
yaourt -S zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

yaourt -S xclip

#install i3 and deps
yaourt -S i3-gaps i3blocks-gaps-git

#git config
git clone https://github.com/KasperHdL/config
mv config/* .config/
rm -rf config

#install unity
yaourt -S unity-editor

#install vim
yaourt -S vim

#git vim config and init vim submodules
git clone https://github.com/KasperHdL/vim
mv vim .vim
ln -s .vim/vimrc .vimrc

cd .vim
git submodule update --init -recursive
cd bundle/YouCompleteMe
./install.py --clang-completer --omnisharp-completer

echo "Finished Installing Vim"
cd

yaourt -S brave
yaourt -S gitkraken
yaourt -S spotify
yaourt -S playerctl


echo "Zsh needs to be set as standard for your user! and Zshrc needs to point to the correct ohmyzsh(unless username is kaholi)! run: chsh -s /bin/zsh"
