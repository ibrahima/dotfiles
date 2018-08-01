alias ack='ack-grep'

function make(){
    MAKEBIN=`which make`
    time $MAKEBIN "$@" -j $(nproc)
    EXITCODE=$?
    QUIET=false
    OPTIND=1
    while getopts ":q" opt; do
	case $opt in
	    q)
		QUIET=true
		;;
	esac
    done
    if ! $QUIET; then
	if [ $EXITCODE -eq 0 ]; then
	    alert "Make succeeded"
#	    ogg123 -q /usr/share/sounds/freedesktop/stereo/complete.oga
	else
	    alert "Make failed"
#	    ogg123 -q /usr/share/sounds/ubuntu/stereo/dialog-warning.ogg
	fi
    fi
    return $EXITCODE
}

function rebash(){
    source ~/.bashrc
}

alias gitcompare='git log --left-right --graph --cherry-pick --oneline'

alias emacs='emacsclient -a "" -t'
alias e='emacsclient -a "" -t'
alias efast='/usr/bin/env emacs -Q -nw'
alias ge='nohup emacsclient -c -a "" > ~/tmp/emacs.log &'
export VISUAL='emacsclient -a "" -t'
export EDITOR='emacsclient -a "" -t'

alias greppkgs='dpkg --get-selections | grep'

function targets(){
	make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}'
}

alias grepcmake="find . -name CMakeLists.txt | xargs grep --color=always -C5"

alias fullpath='readlink -f'

function lcd() {
    cd "$@"
    l
}

alias cdl="lcd"

function easymail() {
    uuencode "$1" "$1" | mail -s "$2" "$3"
}

alias syslog="less /var/log/syslog"
alias boom="gksu pm-suspend"
