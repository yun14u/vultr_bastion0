#!/bin/bash
# add non-root userid - root can login later to reset this userid's password
cat << EOF0 > /tmp/adduser1.sh
#!/bin/bash
/usr/sbin/adduser --gecos "" --disabled-password yun14u
/usr/sbin/usermod -aG sudo yun14u

EOF0

chmod 700 /tmp/adduser1.sh
/tmp/adduser1.sh
