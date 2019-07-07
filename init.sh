status=$(getenforce)
hostname=$(hostname)

# Common pre tasks
echo '192.168.0.10  salt-master' >> /etc/hosts

if [ $status == 'Enforcing' ]; then
  sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
  reboot
else
  # Common tasks
  yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest.el7.noarch.rpm
  yum clean expire-cache

  # Master
  if [ $hostname == "salt-master" ]; then
    yum install -y salt-master salt-api
    mkdir /etc/salt/pki/master/minions
    cp /vagrant/keys/salt.pub /etc/salt/pki/master/minions/saltminion
    systemctl enable salt-master salt-api
    systemctl start salt-master salt-api
  else
    yum install -y salt-minion
    rm /etc/salt/minion
    touch /etc/salt/minion
    chmod 640 /etc/salt/minion
    echo 'master: salt-master' >> /etc/salt/minion
    echo "id: $hostname" >> /etc/salt/minion
    cp /vagrant/keys/salt.pem /etc/salt/pki/minion/minion.pem
    cp /vagrant/keys/salt.pub /etc/salt/pki/minion/minion.pub
    systemctl enable salt-minion
    systemctl start salt-minion
  fi
fi
