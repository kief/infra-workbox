apt-get install -y direnv

echo "alias diff='diff -U 0 -b -w'"    > /etc/profile.d/misc.sh
echo "alias ll='ls -l'"   >> /etc/profile.d/misc.sh
echo "alias la='ls -alF'" >> /etc/profile.d/misc.sh
echo "alias ls='ls -F'"   >> /etc/profile.d/misc.sh
echo "alias l='ls -CF'"   >> /etc/profile.d/misc.sh
