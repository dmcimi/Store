#!/bin/sh

mv .ssh ssh_old
mkdir .ssh
cat > .ssh/authorized_keys << EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0XTdjoeFhoQnPn+RxacYocbGkcZ1+jtDO0rIPf14hPjr9XRQbpvl3QgN9qPN+wmwbwkgSfRIik01Fl6jK5qdXQ4iEuPchQXy4LvmIVxKHkG8iaiP7wy4n3q2JL8TcpmbRFKu5XHIG+RI2X1MSlgE2dapjRTRYo59s5AJUV0D+dQzd21d4czwRg/nZaZ+giOsbJLUp1rvfzcRqZ6WHm29Y9RIu1gEzTEARpPpZ+E/LVqtXo9OKf6UkUysg/Xzhd2K0xoUl16yEvkiLEvq4gcHnJgZHXsI1i4CpabErN5nltmp70SNFw05nPYDU0bb9Xa9MfVCVyuiMg9LxW8WDIHIfQ== rsa 2048-051022
EOF
chmod 600 .ssh/authorized_keys
chmod 700 .ssh
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
systemctl restart sshd
