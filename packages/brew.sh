
#Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# Cask
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions
brew tap homebrew/science

#install brew-cask
brew install 

tools=(
    coreutils 
    git 
    openssl 
    wget 
    xz 
    tree 
    tmux 
    htop 
    readline 
    guetzli
    chisel
    neofetch
    dockutil
    brew-cask
)

# Install tools
brew install "${tools[@]}"
export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
export DOTFILES_BREW_PREFIX_CHISEL=`brew --prefix chisel`

brew cask install java

pls=( 
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
) 

# Install tools
brew install "${pls[@]}"

# sleep 1
sleep 1


# Remove outdated versions from the cellar.
brew cleanup

