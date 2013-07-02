default["reviewboard"]["user"] = "vagrant"
default["reviewboard"]["home"] = "/home/#{default["reviewboard"]["user"]}"
default["reviewboard"]["env"] = "rbenv"
default["reviewboard"]["env_path"] = "#{default["reviewboard"]["home"]}/#{default["reviewboard"]["env"]}"
