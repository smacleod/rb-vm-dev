include_recipe "python::default"

package "git" do
  action :install
end

package "subversion" do
  action :install
end

package "mercurial" do
  action :install
end

package "cvs" do
  action :install
end

package "patch" do
  action :install
end

package "python-subversion" do
  action :install
end

package "python-svn" do
  action :install
end

package "pylucene" do
  action :install
end

package "monotone" do
  action :install
end

package "stunnel" do
  action :install
end

python_pip "nose"
python_pip "Sphinx"
python_pip "kgb"
python_pip "bzr"

include_recipe "reviewboard::perforce"

# Generate an SSH key and add it to the authorized_hosts
# (needed for some tests).
script "gen-ssh-key" do
  interpreter "bash"
  user node.default['reviewboard']['user']
  cwd node.default['reviewboard']['home']
  code <<-EOH
  ssh-keygen -f #{node.default["reviewboard"]["home"]}/.ssh/id_rsa -t rsa -N ''
  cat #{node.default["reviewboard"]["home"]}/.ssh/id_rsa.pub >> #{node.default["reviewboard"]["home"]}/.ssh/authorized_keys
  EOH
  not_if do
    File.exists?("#{node.default["reviewboard"]["home"]}/.ssh/id_rsa.pub")
  end
end


# Create a virtual env which will auto activate on login.
script "auto-source-virtualenv" do
  interpreter "bash"
  user node.default['reviewboard']['user']
  cwd node.default['reviewboard']['home']
  code <<-EOH
  echo "source #{node.default["reviewboard"]["env_path"]}/bin/activate" >> #{node.default['reviewboard']['home']}/.bashrc
  EOH
  not_if do
    File.exists?("#{node.default["reviewboard"]["env_path"]}")
  end
end

python_virtualenv node.default["reviewboard"]["env_path"] do
  options "--system-site-packages"
  owner node.default["reviewboard"]["user"]
  group node.default["reviewboard"]["user"]
  action :create
end
