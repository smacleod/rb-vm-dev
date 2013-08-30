# Install the p4 client
remote_file "/usr/bin/p4" do
  source "http://filehost.perforce.com/perforce/r13.1/bin.linux26x86_64/p4"
  mode 00755
  action :create_if_missing
end

easy_install_package 'P4PythonInstaller' do
  not_if "python -c 'import P4'"
end
