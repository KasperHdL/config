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

#install i3 and deps
echo "installing i3"
yaourt -S i3-gaps i3blocks-gaps-git i3lock-fancy-git rofi feh compton playerctl --noconfirm

echo "cloning config files"
#git config
git clone https://github.com/KasperHdL/.config

#move config files
mkdir temp
mv temp/.config/* .config/
mv temp/.config/.* .config/
rm -rf temp

#install vim
echo "installing vim"
yaourt -S vim --noconfirm

echo "cloning vim config"
#git vim config and init vim submodules
git clone https://github.com/KasperHdL/vim
mv vim .vim
ln -s .vim/vimrc .vimrc

echo "initing vim submodules"
cd .vim/bundle
git submodule update --init -recursive
cd YouCompleteMe
./install.py --all

echo "Finished Installing Vim"
cd


echo "installing various programs"
yaourt -S vivaldi
yaourt -S gitkraken
yaourt -S spotify
yaourt -S thunderbird
yaourt -S discord-canary
yaourt -S slack-desktop
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
