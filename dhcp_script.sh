#!/bin/bash

# Version 0.1

ssh root@172.16.1.10 <<END
  yum install dhcp -y
  cd /etc/dhcp/
  curl https://raw.githubusercontent.com/Oliver-Mustoe/Solid-Tortoise-Final-Project/main/dhcp01/dhcpd.conf > dhcpd.conf
  sudo systemctl start dhcpd
  sudo systemctl restart dhcpd
END

ssh root@172.16.1.11 <<END
  yum install dhcp -y
  cd /etc/dhcp/
  curl https://raw.githubusercontent.com/Oliver-Mustoe/Solid-Tortoise-Final-Project/main/dhcp02/dhcpd.conf > dhcpd.conf
  sudo systemctl start dhcpd
  sudo systemctl restart dhcpd
END
