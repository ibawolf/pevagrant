#!/usr/bin/env bash

systemctl stop iptables.service
cp /vagrant/puppetagent/hosts /etc/hosts
/usr/bin/curl -k https://puppet-master.puppet.vm:8140/packages/current/install.bash | bash
systemctl stop puppet.service
mkdir -p /etc/puppetlabs/facter/facts.d

# Copy a fact into place


# run the puppet agent 
puppet agent -t
