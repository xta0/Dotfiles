
# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

if [ ! -n "$DOTFILES_DIR" ]; then 
    DOTFILES_DIR=~/.dotfiles
fi

for DOTFILE in "$DOTFILES_DIR"/system/{exports,env,functions,,alias,alias_macos,path}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done



unset DOTFILE

export DOTFILES_DIR