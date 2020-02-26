env=${1:-stage}

cd "$DOCUMENTS/synthesis/vpns/${env}" && \
    sudo openvpn --config "$DOCUMENTS/synthesis/vpns/${env}/client.conf" \
    --setenv PATH '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' \
    --script-security 2 \
    --up /etc/openvpn/scripts/update-systemd-resolved \
    --down /etc/openvpn/scripts/update-systemd-resolved \
    --down-pre
