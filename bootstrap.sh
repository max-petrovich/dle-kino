#!/bin/bash

# Bootstrap DLE instance

root=/var/www
public_dir=$root/public

# Create needed directories
echo "Create directory structure"

mkdir -p $public_dir/engine/cache/system
mkdir -p $public_dir/uploads
mkdir -p $public_dir/uploads/files
mkdir -p $public_dir/uploads/fotos
mkdir -p $public_dir/uploads/posts/thumbs
mkdir -p $public_dir/uploads/thumbs

# Modify config
echo "Modify config, replace db config file"
cp $root/provision/config/dbconfig.php $public_dir/engine/data
replace "dle103u.dev" "192.168.33.20" -- $public_dir/engine/data/config.php


sed '/match/{s/match/replace/g;p;D}; /match/!{s/$/replace/g;p;D}' $public_dir/engine/data/config.php -i

# Upload database dump from CMS Backup