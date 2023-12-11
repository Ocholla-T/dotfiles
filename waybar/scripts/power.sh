#!/bin/bash

# Use Rofi to display the menu and get the selected option
selected_option=$(echo -e "Shutdown\nRestart\nSuspend\nLogout\nLock Screen" | rofi -dmenu -p "Power Options:")
# Perform actions based on the selected option
case $selected_option in
    "Shutdown")
        systemctl poweroff
        ;;
    "Restart")
        systemctl reboot
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Logout")
        pkill -KILL -u "$USER"
        ;;
    "Lock Screen")
        # You can use a screen locker like swaylock 
        swaylock -f --color 1e1e2eFF
        ;;
    *)
        echo "Invalid option selected."
        ;;
esac
