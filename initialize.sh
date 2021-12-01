# copying dot files to home
# include dotfiles in match
shopt -s dotglob
for filepath in $HOME/settings/files/*; do
  filename=$(basename "$filepath")
  # move existing files if any
  if [ -e $HOME/$filename ]; then
    # don't overwrite an existing backup for safety
    if [[ -f $HOME/old_dotfiles/$filename && ! -L $HOME/old_dotfiles/$filename ]]; then
      echo Conflict while backing up: remove old_dotfiles/$filename if you are sure your current $HOME/$filename is up to date.
      exit 1
    fi
    mkdir -p $HOME/old_dotfiles
    mv $HOME/$filename $HOME/old_dotfiles/$filename
  fi
  # link to inside
  ln -s $filepath $HOME/$filename
  
done

# append to .bashrc
INCLUDE="

# ntack was here
# include my .bashrc additions if it exists
if [ -f $HOME/settings/files/.bashrc_addons ]; then
    . $HOME/settings/files/.bashrc_addons
fi
"
grep -qxF '# ntack was here' $HOME/.bashrc || echo "$INCLUDE" >> $HOME/.bashrc

