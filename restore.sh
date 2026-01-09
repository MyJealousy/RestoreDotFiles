#!/bin/sh

RESTORE_DIR="$HOME/Documents/Restore"
CONFIG_DST="$HOME/.config"

echo "Available backups:"
ls -d "$RESTORE_DIR"/Config* 2>/dev/null | sed 's#.*/##'

echo "Which config to restore?"
read choice

BACKUP="$RESTORE_DIR/$choice"
[ ! -d "$BACKUP" ] && echo "Invalid choice" && exit 1

echo "This will DELETE ~/.config and restore $choice. Sure? (y/n)"
read confirm
[ "$confirm" != "y" ] && exit 0

rm -rf "$CONFIG_DST"
mkdir "$CONFIG_DST"

cp -r "$BACKUP/"* "$CONFIG_DST/"

echo "Restored $choice"


echo "Restart hyprland (y/n)"
read confirm
[ "$confirm" != "y" ] && exit 0

hyprctl reload
