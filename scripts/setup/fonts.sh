unzip $HOME/.local/share/tmp/FiraCode.zip -d $HOME/.local/share/fonts/
fc-cache -vf $HOME/.local/share/fonts/
fc-list : family style | grep -i nerd
