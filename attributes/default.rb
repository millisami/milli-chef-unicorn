default['red_unicorn']['version'] = '> 0'
default['red_unicorn']['exec'] = File.join(node['languages']['ruby']['bin_dir'], 'red_unicorn')

default['unicorn']['version'] = "4.0.1"
default['unicorn']['config_path'] = "/etc/unicorn"

default['unicorn']['worker_count'] = 4
default['unicorn']['timeout'] = 20
