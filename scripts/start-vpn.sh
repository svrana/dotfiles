sudo openvpn --config $VPN_DIR/client.ovpn --up /etc/openvpn/update-resolv-conf --down /etc/openvpn/update-resolv-conf --script-security 2
