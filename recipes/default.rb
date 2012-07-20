
# include_recipe "bluepill"

# chef_gem "bluepill"

cookbook_file "/usr/local/bin/unicornctl" do
  mode  0755
  owner 'root'
  group 'root'
end
