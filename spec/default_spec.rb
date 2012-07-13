require 'chefspec'

describe 'milli-chef-unicorn::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'milli-chef-unicorn::default' }

  it "should install the unicorn gem" do
    chef_run.should install_gem_package "unicorn"
  end

  it "should log the node platform" do
    runner = ChefSpec::ChefRunner.new
    runner.node.config_path = '/etc/unicorn'
    runner.converge 'milli-chef-unicorn::default'
    runner.should create_directory '/etc/unicorn'
  end

  it "should log the node platform" do
    runner = ChefSpec::ChefRunner.new do |node|
      node['config_path'] = '/etc/unicorn'
    end
    runner.converge 'milli-chef-unicorn::default'
    runner.should create_directory '/etc/unicorn'
  end

  it 'should create the application unicorn config file' do

    # chef_run.should create_file_with_content('/etc/foo', expected_content)
    chef_run.should create_cookbook_file "/usr/local/bin/unicornctl"
    chef_run.cookbook_file("/usr/local/bin/unicornctl").should be_owned_by('root', 'root')
    chef_run.should create_directory '/etc/unicorn'
  end
end


