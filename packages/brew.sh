
#Install homebrew
# Clone the Homebrew repository if brew doesn't already exist
if [ ! -f "$HOME/homebrew/bin/brew" ]; then
    git clone https://github.com/Homebrew/brew ~/homebrew
fi

# Export Homebrew's bin and sbin to your PATH if it's not already included
if [[ ":$PATH:" != *":$HOME/homebrew/bin:"* ]]; then
    export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH"
fi

# Check if brew command is available after the operation
if command -v brew >/dev/null 2>&1; then
    echo "Brew is installed and available."
else
    echo "Brew is not installed or not found in the PATH."
fi

brew update
brew upgrade

tools=(
    coreutils
    wget
    ccat
    xz
    tree
    neofetch
    dockutil
)

# Install tools
brew install "${tools[@]}"

pls=(
)

# Install tools
brew install "${pls[@]}"

# sleep 1
sleep 1

# Remove outdated versions from the cellar.
brew cleanup
