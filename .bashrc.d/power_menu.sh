#!/bin/sh

ACTION=`zenity --width=90 --height=200 --list --radiolist --text="Select logout action" --title="Logout" --column "Choice" --column "Action" TRUE Shutdown FALSE Reboot FALSE LockScreen FALSE Suspend`

if [ -n "${ACTION}" ];then
    case $ACTION in
        Shutdown)
            zenity --question --text "Are you sure you want to halt?" && dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 "org.freedesktop.login1.Manager.PowerOff" boolean:true
            ;;
        Reboot)
            zenity --question --text "Are you sure you want to reboot?" && dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 "org.freedesktop.login1.Manager.Reboot" boolean:true
            ;;
        Suspend)
            #gksudo pm-suspend
            dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 "org.freedesktop.login1.Manager.Suspend" boolean:true
            ;;
        LockScreen)
            gnome-screensaver-command -l
            ;;
    esac
fi
