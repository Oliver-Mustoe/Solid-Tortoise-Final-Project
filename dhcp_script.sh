#!/bin/bash

# Version 0.5

# Config Source: https://www.lisenet.com/2018/configure-dhcp-failover-with-dynamic-dns-on-centos-7/ 

ssh root@172.16.1.10 <<END
  yum install dhcp -y
  cd /etc/dhcp/
  curl https://raw.githubusercontent.com/Oliver-Mustoe/Solid-Tortoise-Final-Project/main/dhcp01/dhcpd.conf > dhcpd.conf
  systemctl start dhcpd
  systemctl restart dhcpd
  systemctl enable dhcpd
  firewall-cmd --add-service=dhcp --permanent
  firewall-cmd --add-port=647/tcp --permanent
  firewall-cmd --add-port=647/udp --permanent
  firewall-cmd --reload
  systemctl restart dhcpd
END

ssh root@172.16.1.11 <<END
  yum install dhcp -y
  cd /etc/dhcp/
  curl https://raw.githubusercontent.com/Oliver-Mustoe/Solid-Tortoise-Final-Project/main/dhcp02/dhcpd.conf > dhcpd.conf
  systemctl start dhcpd
  systemctl restart dhcpd
  systemctl enable dhcpd
  firewall-cmd --add-service=dhcp --permanent
  firewall-cmd --add-port=647/tcp --permanent
  firewall-cmd --add-port=647/udp --permanent
  firewall-cmd --reload
  systemctl restart dhcpd
END
