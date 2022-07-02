### Remap mouse Buttons
https://www.medo64.com/2019/03/remap-m720-mouse-buttons-under-ubuntu/

### Monitor
```
sudo cp ~/.config/monitors.xml ~gdm/.config/monitors.xml
sudo chown gdm:gdm ~gdm/.config/monitors.xml
```

### Dual Boot
```
sudo mount /dev/sdb1 /mnt
sudo cp -ax /mnt/EFI/Microsoft /boot/efi/EFI
```

### elementary appcenter
https://elementaryos.stackexchange.com/questions/8629/disable-appcenter-dock-reminder
The AppCenter periodically shows updates because it runs in the background on startup. To disable its notifications, set it to not run on startup:

mkdir ~/.config/autostart/

cp /etc/xdg/autostart/io.elementary.appcenter-daemon.desktop ~/.config/autostart/

This copies the AppCenter startup directions from the general autostart folder to your personal folder. (The startup process prioritizes directions given in the latter.) Then modify the new file to not load on startup:

echo "X-GNOME-Autostart-enabled=false" | tee -a ~/.config/autostart/io.elementary.appcenter-daemon.desktop

reboot


### Priority of .desktop
.local/share/applications/*.desktop will have a higher priority