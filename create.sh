#!/bin/sh

RESTORE_DIR="$HOME/Documents/Restore"
CONFIG_SRC="$HOME/.config"

echo "Save your dotfiles? (y/n)"
read ans
[ "$ans" != "y" ] && exit 0

mkdir -p "$RESTORE_DIR"

i=1
while [ -d "$RESTORE_DIR/Config$i" ]; do
  i=$((i+1))
done

DEST="$RESTORE_DIR/Config$i"
mkdir "$DEST"

cp -r "$CONFIG_SRC/"* "$DEST/"

echo "Saved to Config$i"
