#!/bin/sh
echo ""
date
rsync -azvP --no-group --no-owner --no-perms /data rsync://${RSYNC_SERVER:-rsync.to}/${RSYNC_VOLUME:-data}