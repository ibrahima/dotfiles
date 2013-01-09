alias db='rosrun pr2_dashboard pr2_dashboard'
alias rviz='rosrun rviz rviz'
alias rviz_nav='roslaunch pr2_navigation_global rviz_move_base.launch'
alias viewsim="roslaunch pr2_gazebo pr2_empty_world.launch"
alias configure="rosrun dynamic_reconfigure reconfigure_gui"
alias texture='rosrun dynamic_reconfigure reconfigure_gui camera_synchronizer_node'

alias teleop='roslaunch pr2_teleop teleop_joystick.launch'
alias teleop_general='roslaunch pr2_teleop_general pr2_teleop_general_joystick.launch'
alias tuckarm='rosrun pr2_tuckarm tuck_arms.py -r t -l t'
alias mannequin='roslaunch pr2_mannequin_mode pr2_mannequin_mode.launch'
alias teleop_keyboard='roslaunch pr2_teleop teleop_keyboard.launch'
alias control='roslaunch pr2_simple_motions_apps move_all.launch'
alias slam='roslaunch pr2_2dnav_slam pr2_2dnav.launch'

alias pcd_viewer='rosrun pcl_visualization pcd_viewer'

alias tilt-lasers='rosrun pr2_mechanism_controllers send_periodic_cmd_srv.py laser_tilt_controller linear 10 0.4 0.0'
alias tilt-lasers-stop='rosrun pr2_mechanism_controllers send_periodic_cmd_srv.py laser_tilt_controller linear 0 0.0 0.0'
alias stances='rosservice list | grep "stances/"'

alias controller_manager='rosrun pr2_controller_manager pr2_controller_manager'
alias reconfigure_gui='rosrun dynamic_reconfigure reconfigure_gui'

function svntag {
	if [ ! "$1" -o ! "$2" -o ! "$3"  ]
	then echo "Usage: svntag [stack_name] [tag_name] [description]"
	else
		STACK_NAME=$1
		TAG_NAME=$2
		DESCRIPTION=$3
		TAG_DIRECTORY=$REPO_ROS/$STACK_NAME/tags/$TAG_NAME
		svn cp $REPO_ROS/$STACK_NAME/trunk $TAG_DIRECTORY -m "$DESCRIPTION"
		echo Description for $TAG_NAME: > ./$TAG_NAME.tmp
		echo $DESCRIPTION >> ./$TAG_NAME.tmp
		svn import ./$TAG_NAME.tmp $TAG_DIRECTORY/description.txt -m "Making descriptive file for $TAG_NAME"
		rm ./$TAG_NAME.tmp
		
	fi
}

function pubsvntag {
	if [ ! "$1" -o ! "$2" -o ! "$3"  ]
	then echo "Usage: pubsvntag [stack_name] [tag_name] [description]"
	else
		STACK_NAME=$1
		TAG_NAME=$2
		DESCRIPTION=$3
		TAG_DIRECTORY=$REPO_PUBLIC/$STACK_NAME/tags/$TAG_NAME
		svn cp $REPO_PUBLIC/$STACK_NAME/trunk $TAG_DIRECTORY -m "$DESCRIPTION"
		echo Description for $TAG_NAME: > ./$TAG_NAME.tmp
		echo $DESCRIPTION >> ./$TAG_NAME.tmp
		svn import ./$TAG_NAME.tmp $TAG_DIRECTORY/description.txt -m "Making descriptive file for $TAG_NAME"
		rm ./$TAG_NAME.tmp
		
	fi
}

function svnvim {
	if [ ! "$1" ]
	then echo "Usage: svnvim [file_name]"
	else
		FILE_NAME=$1
		echo -n > $FILE_NAME
		svn add $FILE_NAME
		vim $FILE_NAME
	fi
}

function camview {
	if [ ! "$1" ]
	then echo "Usage: camview [camera] "
	else
		CAMERA=$1
		rosrun image_view image_view image:=$CAMERA/image_rect_color
	fi
}

function callstance {
    if [ ! "$1" ]
    then echo "Usage: callstance [stance_name] |[duration]|"
    else
        STANCE=$1
        if [ ! "$2" ]
        then DUR=5.0
        else
            DUR=$2
        fi
        rosservice call stances/$STANCE $DUR []
    fi
}
function addstance {
    if [ ! "$1" ]
    then echo "Usage: addstance [stance_name]"
    else
        STANCE=$1
        rosservice call stances/add_current_stance $STANCE torso_lift_link b false false
    fi
}

alias rosenv='env | grep "ROS"'
