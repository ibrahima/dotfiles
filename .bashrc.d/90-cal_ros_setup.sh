ROS_VERSION_FILE=~/.rosconf/ros_version
ROBOT_MODE_FILE=~/.rosconf/robot_mode

read ROS_VERSION < $ROS_VERSION_FILE
export ROS_VERSION
read ROBOT_MODE < $ROBOT_MODE_FILE
export ROBOT_MODE

function change_version {
export ROS_VERSION=$1
echo $ROS_VERSION > $ROS_VERSION_FILE
. /opt/ros/$ROS_VERSION/setup.bash
echo Using $ROS_VERSION 
}

function boxturtle {
change_version boxturtle
}

function cturtle {
change_version cturtle
}

function diamondback {
change_version diamondback
}

function electric {
change_version electric
}

function fuerte {
change_version fuerte
}

function latest {
change_version latest
}

function sim  {
export ROS_MASTER_URI=http://localhost:11311
export ROBOT=sim
echo In simulation mode
echo sim > $ROBOT_MODE_FILE
} 

function brett {
export ROS_MASTER_URI=http://brett1:11311
export ROBOT=brett
echo In brett mode
echo brett > $ROBOT_MODE_FILE
}

eval $ROBOT_MODE
. /opt/ros/$ROS_VERSION/setup.bash

export ROS_PACKAGE_PATH=~/ros:$ROS_PACKAGE_PATH

alias rosenv='env|grep ROS'

if [ -f ~/.ros/moveit ]; then
    source ~/moveit/devel/setup.bash
    echo "Using moveit overlay"
fi

function rosless {
    local arg;
    if [[ $1 = "--help" ]]; then
        echo -e "usage: rossed [package] [file]\n\nEdit a file within a package.";
        return 0;
    fi;
    _roscmd ${1} ${2};
    if [[ -n ${arg} ]]; then
        if [[ -z $PAGER ]]; then
            less ${arg};
        else
            $PAGER ${arg};
        fi;
    fi
}

complete -F "_roscomplete_file" "rosless"
