#!/bin/bash
# Usage: remove all utility bills pdf file password 
shopt -s nullglob
shopt -s dotglob
PWD=`pwd`
for f in *
do
    if [[ "$f" != ".git" && "$f" != "link.sh" ]]; then
	echo "$PWD/$f"
	ln -s "$PWD/$f" ~/
    fi
done
