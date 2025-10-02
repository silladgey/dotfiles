#!/bin/bash

BACKUP_DIR="$HOME/dotfiles_backup"
GITCONFIG="$HOME/.gitconfig"
GITCONFIG_SAMPLE="$BACKUP_DIR/.gitconfig.sample"

cp "$GITCONFIG_SAMPLE" "$GITCONFIG" 2>/dev/null
