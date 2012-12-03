alias ack='ack-grep'

function make(){
    /usr/bin/make "$@" -j $(nproc)
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
	    ogg123 -q /usr/share/sounds/freedesktop/stereo/complete.oga
	else
	    alert "Make failed"
	    ogg123 -q /usr/share/sounds/ubuntu/stereo/dialog-warning.ogg
	fi
    fi
}

function rebash(){
    source ~/.bashrc
}

alias gitcompare='git log --left-right --graph --cherry-pick --oneline'

alias emacs='emacsclient -a "" -t'

export VISUAL='emacsclient -a "" -t'

alias greppkgs='dpkg --get-selections | grep'
