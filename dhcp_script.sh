#!/bin/bash

# Version 0.1

ssh root@172.16.1.10 <<END
  yum install dhcp -y
  cd /home/champuser
  curl https://raw.githubusercontent.com/Oliver-Mustoe/Solid-Tortoise-Final-Project/main/dhcp01/dhcpd.conf > dhcpd.conf
  mv /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.bak
  mv ./dhcpd.conf /etc/dhcp/dhcpd.conf.new
  cd /etc/dhcp/
  mv ./dhcpd.conf.new ./dhcpd.conf
  sudo systemctl start dhcpd
  sudo systemctl restart dhcpd
END

ssh root@172.16.1.11 <<END
  yum install dhcp -y
  cd /home/champuser
  curl https://raw.githubusercontent.com/Oliver-Mustoe/Solid-Tortoise-Final-Project/main/dhcp01/dhcpd.conf > dhcpd.conf
  mv /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.bak
  mv ./dhcpd.conf /etc/dhcp/dhcpd.conf
  mv ./dhcpd.conf /etc/dhcp/dhcpd.conf.new
  cd /etc/dhcp/
  mv ./dhcpd.conf.new ./dhcpd.conf
  sudo systemctl start dhcpd
  sudo systemctl restart dhcpd
END
