
#Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

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
)

# Install tools
brew install "${tools[@]}"
export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
export DOTFILES_BREW_PREFIX_CHISEL=`brew --prefix chisel`

brew tap homebrew/science

pls=( 
    haskell-stack 
    smlnj 
    clisp 
    mit-scheme 
    scala 
    lua 
    python 
    python3 
    golang 
    octave
) 

# Install tools
brew install "${pls[@]}"

# sleep 1
sleep 1

# Remove outdated versions from the cellar.
brew cleanup

