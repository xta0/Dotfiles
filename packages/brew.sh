
#Install homebrew
git clone https://github.com/Homebrew/brew ~/homebrew

export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH"

brew update
brew upgrade

tools=(
    coreutils
    wget
    ccat
    xz
    tree
    xctool
    neofetch
    dockutil
)

# Install tools
brew install "${tools[@]}"

pls=(
    lua
)

# Install tools
brew install "${pls[@]}"

# sleep 1
sleep 1

# Remove outdated versions from the cellar.
brew cleanup
