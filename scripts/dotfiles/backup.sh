#!/bin/bash

BACKUP_DIR="$HOME/dotfiles_backup"
BASHRC="$HOME/.bashrc"
BASH_PROFILE="$HOME/.bash_profile"
ZSHRC="$HOME/.zshrc"
GITCONFIG="$HOME/.gitconfig"
GITCONFIG_SAMPLE="$HOME/.gitconfig.sample"

mkdir -p ~/dotfiles_backup

awk '
/^\[user\]/ { in_user = 1; print; next }
/^\[.*\]/   { in_user = 0; print; next }
in_user && /^\s*email\s*=/ { sub(/=.*/, "= "); print; next }
in_user && /^\s*name\s*=/  { sub(/=.*/, "= "); print; next }
{ print }
' "$GITCONFIG" > "$GITCONFIG_SAMPLE"

cp "$BASHRC" "$BASH_PROFILE" "$ZSHRC" "$BACKUP_DIR" 2>/dev/null
cp "$GITCONFIG_SAMPLE" "BACKUP_DIR" 2>/dev/null

echo "Backup saved to: $BACKUP_DIR"
