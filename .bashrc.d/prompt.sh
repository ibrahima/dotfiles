#define some cool colors
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# Functions grabbed from https://gist.github.com/293517 for 256 color prompts
function boldtext {
    echo "\\[\\033[1m\\]"$1"\\[\\033[0m\\]"
}

function bgcolor {
    echo "\\[\\033[48;5;"$1"m\\]"
}

function fgcolor {
    echo "\\[\\033[38;5;"$1"m\\]"
}

function resetcolor {
    echo "\\[\\e[0m\\]"
}

# From http://serverfault.com/questions/221108/different-color-prompts-for-different-machines-when-using-terminal-ssh
hostnamecolor=$(hostname | od | tr ' ' '\n' | awk '{total = total + $1}END{print (total % 256)}')

# Use the builtin __git_ps1 function, just with brackets, and show dirty state
export GIT_PS1_SHOWDIRTYSTATE=1

function parse_git_branch {
    __git_ps1 | tr '()' '[]'
}

# from https://github.com/jegbjerg/battery-prompt.sh/blob/master/battery-prompt.sh
# which seems to be taken from http://arighi.blogspot.com/2009/05/battery-life-in-bash-prompt.html
function get_battery_info()
{
    BATT_INFO=$(acpi -b | awk -F', ' '{print $2}')
    AC_INFO=$(acpi -a | awk -F': ' '{print $2}')

    if [ $AC_INFO = "off-line" ]
    then
        BATT_PERC=${BATT_INFO:0:${#BATT_INFO}-1}

        if [ $BATT_PERC -ge 75 ]
        then
            BCOLOR=$bldgrn
        elif [ $BATT_PERC -le 25 ]
        then
            BCOLOR=$bldred
        else
            BCOLOR=$bldylw
        fi
    else
        BCOLOR=$undblk
    fi
}

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Using a trick I got from http://superuser.com/questions/49092/how-to-format-the-path-in-a-zsh-prompt
# to color the slashes in the working directory
if [ "$color_prompt" = yes ]; then
    PROMPT_COMMAND='usercolor=${txtred};PS1="$(pwd)";get_battery_info;PS1="${PS1/$HOME/~}";PS1="${debian_chroot:+($debian_chroot)}\[$bldgrn\]\u@$(fgcolor $hostnamecolor)\h$txtrst:$bldblu${PS1//\//$txtred/$bldblu}$txtrst$bldred\$(parse_git_branch)\[$txtrst\] \[$undcyn\]\T \d\[$txtrst\] ${BCOLOR}${BATT_PERC}%${txtrst}
\$ "'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
