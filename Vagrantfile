# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # config.vm.box = "ubuntu/trusty64"

  config.vm.box = "chef/centos-7.0"
  # config.vm.network :private_network, ip: "192.168.10.20"

  config.vm.network :forwarded_port, guest: 2003, host: 2003
  config.vm.network :forwarded_port, guest: 2004, host: 2004
  config.vm.network :forwarded_port, guest: 7002, host: 7002
  config.vm.network :forwarded_port, guest:   80, host: 8080
  config.vm.network :forwarded_port, guest: 8125, host: 8125

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2096, '--cpus', '2']
    vb.gui = true  # -- default, false  -- headless mode
  end

  # vagrant provision --provision-with ansible
  # ansible-playbook -i ./ansible_hosts -v --timeout 30  --forks 1 graphite.yml
  # 
  #config.vm.provision "ansible" do |ans| 
  #  ans.playbook = "graphite.yml"
  #end 

  # Playbook notes:
  #   roles/nodejs: (now) using EPEL rpm; good enough?
  #   roles/statsd: Github, define fixed, 'stable' version
  #   roles/X, add packages:  sudo yum install emacs-nox elinks nmap-ncat
  #   roles/Z: 
  #   

# vagrant provision --provision-with shell
  config.vm.provision :shell, :inline => <<-SCRIPT
    echo "**** Shell-provisioning this Vagrant box... or NOT! :)"
    sudo yum -y install emacs-nox elinks nmap-ncat
SCRIPT

end

# ln -s .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ansible_hosts
# ansible-playbook -i ./ansible_hosts -v --timeout 30  --forks 1 graphite.yml
