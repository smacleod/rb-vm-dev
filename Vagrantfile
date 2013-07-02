# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "raring64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  config.vm.provider :virtualbox do |vb|
    # vb.name = "reviewboard_dev"

    # Don't boot with headless mode
    # vb.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    # b.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.synced_folder "src/", "/src"

  # Update the version of Chef that comes with the box.
  # (10.12.0 -> 11.4.4)
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.run_list = [
      "recipe[chef-upgrade]"
    ]
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.run_list = [
      "recipe[python]",
      "recipe[reviewboard]",
    ]
  end

end
