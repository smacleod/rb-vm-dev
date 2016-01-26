# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install python-dev
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install python-setuptools
sudo easy_install pip
sudo pip install ansible==1.9.4
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.provider :vmware_fusion do |vmf, override|
    override.vm.box = "precise64_vmware"
    override.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"
  end

  config.vm.provider :vmware_workstation do |vmf, override|
    override.vm.box = "precise64_vmware"
    override.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"
  end

  config.vm.provider :virtualbox do |vb, override|
    override.vm.box = "precise64"
    override.vm.box_url = "http://files.vagrantup.com/precise64.box"
  end

  config.vm.provider :parallels do |prl, override|
    override.vm.box = "precise64"
    override.vm.box_url = "http://download.parallels.com/desktop/vagrant/precise64.box"
  end

  config.vm.network "private_network", type: "dhcp"
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.synced_folder "src/", "/src", :nfs => true

  # Workaround ansible 2.0 and vagrant < 1.8.2 problems
  # causing the ansible install to fail. We force
  # the install of an old ansible version.
  config.vm.provision "shell", inline: $script

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/dev-environment.yml"
    # ansible.verbose = true
  end

end
