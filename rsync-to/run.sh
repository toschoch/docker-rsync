#!/bin/sh
VOLUME=${VOLUME:-data}
ALLOW=${ALLOW:-192.168.0.0/16 172.16.0.0/12}
OWNER=${OWNER:-root}
GROUP=${GROUP:-root}

chown "${OWNER}:${GROUP}" "${VOLUME}"

cat <<EOF > /etc/rsyncd.conf
uid = ${OWNER}
gid = ${GROUP}
use chroot = yes
log file = /dev/stdout
reverse lookup = no

[${VOLUME}]
    hosts deny = *
    hosts allow = ${ALLOW}
    read only = false
    path = ./
    comment = data volume
EOF

exec /usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf
