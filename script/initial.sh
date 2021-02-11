#!/bin/bash
# add non-root userid - root can login later to reset this userid's password
cat << EOF0 > /tmp/adduser1.sh
#!/bin/bash
/usr/sbin/adduser --gecos "" --disabled-password foobar
/usr/sbin/usermod -aG sudo foobar

EOF0

chmod 700 /tmp/adduser1.sh
/tmp/adduser1.sh
