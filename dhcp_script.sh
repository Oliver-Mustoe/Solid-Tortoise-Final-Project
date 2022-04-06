#!/bin/bash

# Version 0.1

ssh champuser@172.16.1.10 <<END
  sudo -i
  curl https://raw.githubusercontent.com/Oliver-Mustoe/Solid-Tortoise-Final-Project/main/dhcp01/dhcpd.conf > dhcpd.conf
  mv dhcpd.conf /etc/dhcp/dhcpd.conf
  sudo systemctl start dhcpd
  sudo systemctl restart dhcpd
END

ssh champuser@172.16.1.11 <<END
  sudo -i
  curl https://raw.githubusercontent.com/Oliver-Mustoe/Solid-Tortoise-Final-Project/main/dhcp01/dhcpd.conf > dhcpd.conf
  mv dhcpd.conf /etc/dhcp/dhcpd.conf
  sudo systemctl start dhcpd
  sudo systemctl restart dhcpd
END
