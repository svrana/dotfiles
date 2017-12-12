cd $DOCUMENTS/wish/vpn && sudo openvpn --config $DOCUMENTS/wish/vpn/client.conf --up /etc/openvpn/update-resolv-conf --down /etc/openvpn/update-resolv-conf --script-security 2
