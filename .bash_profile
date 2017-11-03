
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -d "$HOME/.dotfiles"]; then
    DOTFILES_DIR="$HOME/.dotfiles"
else
    echo "Unable to find dotfiles, exiting."
    exit 1w
fi

#source files
for DOTFILE in "$DOTFILES_DIR"/system/.{alias,alias_macos,functions}; do 
    [ -f "$DOTFILE" ] && ."$DOTFILE"
done



# clean up
unset DOTFILE

#export
export DOTFILES_DIR