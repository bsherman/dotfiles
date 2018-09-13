#!/usr/bin/env bash -x

# python  pyenv and neovim setup
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
pyenv install 3.6.6
pyenv virtualenv 3.6.6 neovim3
pyenv activate neovim3
pip install neovim

# The following is optional, and the neovim3 env is still active
# This allows flake8 to be available to linter plugins regardless
# of what env is currently active.  Repeat this pattern for other
# packages that provide cli programs that are used in Neovim.
pip install flake8
ln -s `pyenv which flake8` ~/bin/flake8  # Assumes that $HOME/bin is in $PATH

#Now that you've noted the interpreter paths, add the following to your init.vim file:
pyenv which python  # Note the path
PYNVPATH=`pyenv which python`
echo "let g:python3_host_prog = '$PYNVPATH'" >> ~/.config/nvim/init.vim
