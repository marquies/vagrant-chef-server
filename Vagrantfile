# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-14.04"  

#  config.vm.network :private_network, ip: "10.33.33.33"
#  config.vm.network :forwarded_port, guest: 80, host: 8000
#  config.vm.network :forwarded_port, guest: 443, host: 8443

  config.vm.network "public_network", bridge: "en0: WLAN (AirPort)"

  config.vm.provider :virtualbox do |v|
    v.name = "chef-server"
    v.customize ["modifyvm", :id, "--cpus", "2"]
    v.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :shell, path: "bootstrap.sh"


end
