#!/bin/bash
WORKDIR=/usr/src/app

echo $CLOUDFLEET_DOMAIN > $WORKDIR/config/host_list
echo $CLOUDFLEET_DOMAIN > $WORKDIR/config/me

echo <<EOF

host=$CLOUDFLEET_MAIL_RELAY
port=125
enable_tls=1

auth_type=plain
auth_user=$CLOUDFLEET_DOMAIN
auth_pass=$CLOUDFLEET_SECRET

EOF > $WORKDIR/config/smtp_forward.ini

haraka -c $WORKDIR
