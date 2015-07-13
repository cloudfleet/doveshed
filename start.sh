#!/bin/bash
WORKDIR=/usr/src/app

echo $CLOUDFLEET_DOMAIN > $WORKDIR/config/host_list
echo $CLOUDFLEET_DOMAIN > $WORKDIR/config/me

cat > $WORKDIR/config/smtp_forward.ini <<EOF

host=$CLOUDFLEET_MAIL_RELAY
port=125
enable_tls=true

auth_type=plain
auth_user=$CLOUDFLEET_DOMAIN
auth_pass=$CLOUDFLEET_SECRET

EOF

haraka -c $WORKDIR
