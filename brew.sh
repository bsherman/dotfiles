#!/usr/bin/env bash -x

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew tap caskroom/versions

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
#brew install gnupg
# instead using cask gpg-suite

# Install more recent versions of some macOS tools.
#brew install vim --with-override-system-vi
brew install grep
#brew install openssh
#brew install screen
brew install tmux
brew install tmate
#brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#brew install aircrack-ng
#brew install bfg
#brew install binutils
#brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra
#brew install john
#brew install knock
#brew install netpbm
brew install nmap
#brew install pngcheck
brew install socat
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.
#brew install xpdf
#brew install xz

# Install other useful binaries.
#brew install ack
brew install bat
#brew install exiv2
sbrew install git
#brew install git-lfs
#brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
#brew install ssh-copy-id
brew install tree
brew install vbindiff
#brew install zopfli

# Install stuff for dev
#brew install groovy
#brew install ant
#brew install maven
#brew install kubectl 
#brew install python3
#brew install pyenv-virtualenv
brew install htop
brew install pstree
brew install pwgen
#
brew install exiftool
#brew install tinc
brew install neovim
brew install restic
brew install minio-mc

# stuff for cloud dev
brew install bats
brew install go
brew install rustup-init
brew install awscli
brew install jq
#brew cask install chefdk
#chef gem install test-kitchen
#chef gem install kitchen-ec2
#chef gem install rake
#chef gem install inspec
#chef gem install kitchen-inspec
#chef gem install kitchen-sync
#chef gem install berkshelf
#chef gem install awspec
#brew install packer

#terraform
#brew install terraform
brew tap Yleisradio/terraforms
brew install chtf

# aws
brew tap fullscreen/tap
brew install aws-rotate-key

#
#brew cask install chromium
brew cask install docker
brew cask install etcher
#brew cask install fantastical
brew cask install firefox
brew cask install gpg-suite
brew cask install iterm2
brew cask install java
brew cask install java8
brew cask install lyn
brew cask install macvim
#brew cask install postgres
brew cask install postman
brew cask install rambox
brew cask install sizeup
brew cask install skype
brew cask install sourcetree
brew cask install tunnelblick
#brew cask install visualvm
brew cask install xquartz


# Remove outdated versions from the cellar.
brew cleanup
