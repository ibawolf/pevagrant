#!/usr/bin/env bash

#service iptables stop
yum install vim
systemctl stop iptables.service
useradd pe-puppet
cp /vagrant/hosts /etc/hosts
cp /vagrant/puppetmaster/puppet-enterprise-2016.4.2-el-7-x86_64.tar.gz /root
cd /root
tar zxf puppet-enterprise-2016.4.2-el-7-x86_64.tar.gz
cd puppet-enterprise-2016.4.2-el-7-x86_64
cp /vagrant/puppetmaster/pe.conf ./pe.conf
#mkdir -p /opt/puppetlabs/server/apps
#mkdir -p /etc/puppetlabs/puppetserver/
#mkdir -p /opt/puppetlabs/server/apps/
./puppet-enterprise-installer -c /root/puppet-enterprise-2016.4.2-el-7-x86_64/pe.conf
#mkdir /etc/puppetlabs/puppetserver/ssh
#cp /vagrant/puppetmaster/id_rsa /etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa
#chown pe-puppet:pe-puppet /etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa
#chmod 600 /etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa
#cp /vagrant/puppetmaster/id_rsa /root/.ssh
#chmod 600 /root/.ssh/id_rsa
/usr/local/bin/r10k deploy environment -p
cp -f /vagrant/puppetmaster/hiera.yaml /etc/puppetlabs/puppet/hiera.yaml
cp -f /vagrant/puppetmaster/autosign.conf /etc/puppetlabs/puppet/autosign.conf
systemctl restart pe-puppetserver
puppet agent -t
yum install vim-enhanced mlocate
updatedb
echo "DONE"
