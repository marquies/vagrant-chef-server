#!/usr/bin/env bash

apt-get update
apt-get install -y wget 

echo "Downloading chef-server-core packages (in quite mode)"

if [ ! -f hef-server-core_12.8.0-1_amd64.deb ] ; then
  wget -q https://packages.chef.io/stable/ubuntu/14.04/chef-server-core_12.8.0-1_amd64.deb
fi

dpkg -i chef-server-core_12.8.0-1_amd64.deb

chef-server-ctl reconfigure

echo "Register basic users, takes some time"

chef-server-ctl user-create chef-admin Chef Koch no@nothing.com 'chef-admin' --filename ~/chef-admin.pem
chef-server-ctl org-create mycorp 'My Corperation' --association_user chef-admin --filename ~/mycorp-validator.pem

echo "Installing Chef Management Console (chef-manage)"

chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure --accept-license

echo "You can now login with http://_IP_    User chef-admin:chef-admin"
