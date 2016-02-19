#!/usr/bin/env bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

writecmd() {
  perl -e '$TIOCSTI = 0x5412; $l = <STDIN>; $lc = $ARGV[0] eq "-run" ? "\n" : ""; $l =~ s/\s*$/$lc/; map { ioctl STDOUT, $TIOCSTI, $_; } split "", $l;' -- $1
}

function fzh (){
    find ~/.history -name *.hist | sort | echo "$(xargs cat)" "$(history|awk '{$1="";print substr($0,2)}')" | fzf --tac | writecmd
}
