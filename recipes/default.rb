
include_recipe "bluepill"

chef_gem "red_unicorn" do
  version node['red_unicorn']['version']
end

chef_gem "unicorn" do
  version node['unicorn']['version']
end

chef_gem "bluepill"

directory node['unicorn']['config_path'] do
  mode 0755
  action :create
end

cookbook_file "/usr/local/bin/unicornctl" do
  mode  0755
  owner 'root'
  group 'root'
end
