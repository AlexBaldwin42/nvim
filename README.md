# nvim
My neovim config

install.sh is install for ubuntu to install the latest version of neovim  

## WSL
I removed xclip and instal xsel as xclip froze up when copying and pasting.

Remove copy and paste or change to ctrl+shift in the json
Remove ctrl+, from the Actions
install sudo apt-get install ripgrep 

### Download Nerdfont 
https://www.nerdfonts.com/font-downloads

## about
.local/share/nvim is where plugins keep the data
.local/share/nvim/start/ is where plugins are cloned too
.local/share/nvim/opt/ is where lazy loaded plugins are cloned too

Can be deleted if doing funky things
.config/nvim/plugin/packer_compliled.lua  


## Things to try

nvim tree
https://github.com/nvim-tree/nvim-tree.lua

# Fancy git prompt try this
https://www.pragmaticlinux.com/2022/06/show-the-git-branch-in-your-bash-terminal-prompt/
curl -sS https://raw.githubusercontent.com/diogocavilha/fancy-git/master/install.sh | bash
fancygit --suggested-global-git-config-apply
fancygit --disable-time
