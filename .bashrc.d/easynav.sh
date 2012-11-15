#!/usr/bin/env bash

# From http://unix.stackexchange.com/a/14311/27010 - goes up to the named directory
upto ()
{
    if [ -z $1 ]; then
        return;
    fi;
    local upto=$1;
    cd "${PWD/\/$upto\/*//$upto}"
}

_upto ()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    d=${PWD//\//\ }
    COMPREPLY=( $( compgen -W "$d" -- $cur ) )
}
complete -F _cu cu

# My own idea - [c]d [u]p a number of levels
isposint ()
{
    if [ $1 -ge 0 ] 2>/dev/null; then
	true
    else
	false
    fi
}


cu ()
{
if isposint $1; then
    for i in $(seq 1 $1)
    do
        ups=$ups"../"
    done
    cd $ups
else
    echo "Invalid argument; must be a positive integer"
fi
}
