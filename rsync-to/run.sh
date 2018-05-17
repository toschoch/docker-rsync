#!/bin/bash
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
transfer logging = yes


[${VOLUME}]
    hosts deny = *
    hosts allow = ${ALLOW}
    read only = false
    path = ./
    comment = data volume
EOF

# start watching the directory
if [ -z ${SOLR_HOST+x} ]; then
    echo "no solr notification stared!"
else
    echo "install solr notification..."
    exec ./watchfolder.sh &
fi

# start the rsync
exec /usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf

