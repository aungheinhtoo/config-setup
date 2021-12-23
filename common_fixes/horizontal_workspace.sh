#!/usr/bin/env bash
 
# Check if the argument given to the script is "vertical" or "horizontal"
case $1 in 
 
    "vertical") # If vertical,
        # Set vertical keybindings
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Shift><Super>k', '<Shift><Super>Up']"
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Shift><Super>j', '<Shift><Super>Down']"
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Control><Super>k', '<Control><Super>Up']"
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Control><Super>j', '<Control><Super>Down']"
        # Delete horizontal keybindngs
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "[]"
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "[]"
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"
        ;;
 
    "horizontal") # If horizontal,
        # Delete vertical keybindings
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "[]"
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "[]"
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "[]"
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "[]"
        # Set horizontal keybindings
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Shift><Super>h', '<Shift><Super>Left']"
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Shift><Super>l', '<Shift><Super>Right']"
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Super>h', '<Control><Super>Left']"
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Super>l', '<Control><Super>Right']"
        ;;
 
    *) 
        echo "Usage: $0 [vertical|horizontal]"
        exit 1
        ;;
 
esac