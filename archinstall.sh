mkfs.fat -F32 /dev/sdb4
mkfs.btrfs /dev/sdb5
mount /dev/sdb5 /mnt

btrfs su cr /mnt/@
btrfs su cr /mnt/@home
btrfs su cr /mnt/@var
btrfs su cr /mnt/@opt
btrfs su cr /mnt/@tmp
btrfs su cr /mnt/@.snapshots
umount /mnt

mount -o noatime,commit=120,compress=zstd,space_cache,subvol=@ /dev/sdb5 /mnt
# You need to manually create folder to mount the other subvolumes at
mkdir /mnt/{boot,home,var,opt,tmp,.snapshots}

mount -o noatime,commit=120,compress=zstd,space_cache,subvol=@home /dev/sdb5 /mnt/home

mount -o noatime,commit=120,compress=zstd,space_cache,subvol=@opt /dev/sdb5 /mnt/opt

mount -o noatime,commit=120,compress=zstd,space_cache,subvol=@tmp /dev/sdb5 /mnt/tmp

mount -o noatime,commit=120,compress=zstd,space_cache,subvol=@.snapshots /dev/sdb5 /mnt/.snapshots

mount -o subvol=@var /dev/sdb5 /mnt/var
# Mounting the boot partition at /boot folder
mount /dev/sda1 /mnt/boot

pacstrap /mnt base linux linux-firmware nano intel-ucode btrfs-progs vim git
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime

hwclock --systohc

## file edit
vim /etc/locale.gen

locale-gen
echo LANG=en_US.UTF-8 >> /etc/locale.conf


echo arch >> /etc/hostname

nano /etc/hosts

# 127.0.0.1	localhost
# ::1		localhost
# 127.0.1.1	myhostname.localdomain	myhostname

passwd
pacman -S grub grub-btrfs efibootmgr base-devel linux-headers networkmanager network-manager-applet wpa_supplicant dialog os-prober mtools dosfstools reflector git
pacman -S bluez bluez-utils cups

vim /etc/mkinitcpio.conf
## add btrfs to modules
mkinitcpio -p linux
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id = Arch
grub-mkconfig -o /boot/grub/grub.cfg

useradd -mG wheel aungheinhtoo
passwd aungheinhtoo
EDITOR=vim visudo
# uncomment line that says %wheel ALL=(ALL) ALL


systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable org.cups.cupsd



exit
umount -l /mnt
reboot