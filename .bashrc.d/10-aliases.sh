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

# Command line pastebin: ix.io
# Examples:
#     ix hello.txt              # paste file (name/ext will be set).
#     echo Hello world. | ix    # read from STDIN (won't set name/ext).
#     ix -n 1 self_destruct.txt # paste will be deleted after one read.
#     ix -i ID hello.txt        # replace ID, if you have permission.
#     ix -d ID

ix() {
    local opts
    local OPTIND
    [ -f "$HOME/.netrc" ] && opts='-n'
    while getopts ":hd:i:n:" x; do
        case $x in
            h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;
            d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
            i) opts="$opts -X PUT"; local id="$OPTARG";;
            n) opts="$opts -F read:1=$OPTARG";;
        esac
    done
    shift $(($OPTIND - 1))
    [ -t 0 ] && {
        local filename="$1"
        shift
        [ "$filename" ] && {
            curl $opts -F f:1=@"$filename" $* ix.io/$id
            return
        }
        echo "^C to cancel, ^D to send."
    }
    curl $opts -F f:1='<-' $* ix.io/$id
}

function pwdtopath() {
    PWD=$(pwd)
    export PATH=$PWD:$PATH
    echo "PATH is now $PATH"
}

alias dispwork="disper -d eDP-1,DP-1 -t top -e"
alias displaptop="disper -d eDP-1 -s"

function wunderground(){
    curl -s "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-<YOURZIPORLOCATION>}"|perl -ne '/<title>([^<]+)/&&printf "%s: ",$1;/<fcttext>([^<]+)/&&print $1,"\n"';
}

function gs_to_jpg(){
    GS_FLAGS="-sDEVICE=jpeg -dNOPAUSE -dBATCH -dSAFER -dPDFSTOPONERROR"
    gs $GS_FLAGS -sOutputFile=$2 -r300 $1 2>&1
}

function poppler_to_jpg(){
    pdftocairo -r 300 -jpeg $1 $2 2>&1
}

function rb_heap_dump(){
    zcat $1  | ruby -rjson -ne ' obj = JSON.parse($_).values_at("file","line","type"); puts obj.join(":") if obj.first ' |     sort      |     uniq -c   |     sort -n   |     tail -20
}

alias railsc="ssh gsdev -t 'bash -l -c \"cd /app;rails c\"'"
alias sl="ls"

alias docker_clean_containers="docker ps --filter 'status=exited' -aq | xargs docker rm"
alias docker_clean_images="docker images --filter 'dangling=true' -q | xargs docker rmi"

alias dc-ssh="docker-compose exec web bash"
alias dc-up="docker-compose up"

function gsdev() {
    case $1 in
        "up")
            cd ~/gradescope/gradescope-app && docker-compose up
            ;;
        "down")
            cd ~/gradescope/gradescope-app && docker-compose down
            ;;
        "ssh")
            cd ~/gradescope/gradescope-app && docker-compose exec web bash
            ;;
        *)
            cd ~/gradescope/gradescope-app && docker-compose exec web bash
            ;;
    esac
}

function feog() {
    path=$(readlink -f $1)
    echo "local awful = require(\"awful\") ; awful.spawn(\"eog $path\", {floating = true})" | awesome-client
}

alias hyper_spawn="hyper run -d --size=m3 --entrypoint=/bin/bash gradescope/test -c \"buildkite-agent start --disconnect-after-job --disconnect-after-job-timeout 120\""
