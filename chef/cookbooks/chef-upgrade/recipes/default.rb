remote_file "chef-install.sh" do
  source "https://www.opscode.com/chef/install.sh"
  action :create_if_missing
end

bash "Upgrade Chef" do
  code <<-EOH
  chmod +x chef-install.sh
  ./chef-install.sh
  touch chef-upgraded
  EOH

  not_if do
    File.exists?("chef-upgraded")
  end
end
