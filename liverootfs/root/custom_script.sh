#!/bin/sh

USER=kael
PASSWORD=kael

useradd -m -G users,wheel,audio,video -s /bin/bash $USER
passwd -d $USER &>/dev/null
passwd -d root &>/dev/null

echo "root:root" | chpasswd -c SHA512
echo "$USER:$PASSWORD" | chpasswd -c SHA512

echo "kaellinux" > /etc/hostname

for sv in dhcpcd sysklogd gpm; do
	ln -s /etc/sv/$sv /var/service
done
