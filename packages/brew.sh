
#Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

#install brew-cask
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/fonts
brew tap caskroom/versions
brew tap brewsci/homebrew-science
brew tap brewsci/bio

#install Java
brew cask install java

tools=(
    coreutils 
    openssl 
    wget 
    ccat
    xz 
    tree 
    tmux 
    htop 
    telnet
    readline 
    guetzli
    xctool
    chisel
    neofetch
    dockutil
    xquartz
    gcc
    update_xcode_plugins   
)

# Install tools
brew install "${tools[@]}"
export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
export DOTFILES_BREW_PREFIX_CHISEL=`brew --prefix chisel`

pls=( 
    r
    haskell-stack 
    smlnj 
    clisp 
    mit-scheme 
    lua 
    python 
    python3 
    golang 
    octave
    scala
    kylef/formulae/swiftenv
) 

# Install tools
brew install "${pls[@]}"

# sleep 1
sleep 1

# Remove outdated versions from the cellar.
brew cleanup

