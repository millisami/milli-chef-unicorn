
def load_current_resource
  # if(new_resource.unicorn_exec.to_s.empty?)
  #   new_resource.unicorn_exec ::File.join(@new_resource.bundled_bin, 'unicorn_rails')
  # end
end

action :create do

  # bluepill_service new_resource.name do
  #   action :nothing
  # end

  directory ::File.dirname(@new_resource.unicorn_pid) do
    action :create
    owner new_resource.user
    group new_resource.group
  end

  template ::File.join(new_resource.unicorn_directory, "#{new_resource.name}.rb") do
    source new_resource.template_source ? new_resource.template_source : "unicorn.app.erb"
    cookbook new_resource.template_source ? new_resource.cookbook_name : "unicorn"
    mode 0644
    mapped_vars = %w(
      current_path shared_path unicorn_listen unicorn_listen_options
      unicorn_timeout unicorn_pid cow_friendly user group worker_processes unicorn_preload_app unicorn_port
    ).map do |var|
      [var,new_resource.send(var)]
    end
    variables(
      Hash[*mapped_vars.flatten]
    )
    # notifies :restart, resources(:bluepill_service => new_resource.name), :delayed
  end

  # template ::File.join(node['bluepill']['conf_dir'], "#{new_resource.name}.pill") do
  #   source 'bluepill.pill.erb'
  #   cookbook new_resource.cookbook
  #   variables(
  #     :app_name => new_resource.name,
  #     :process_name => "unicorn_#{new_resource.name}",
  #     :pid_file => new_resource.unicorn_pid,
  #     :env => new_resource.environment,
  #     :current_dir => new_resource.current_path,
  #     :user => new_resource.user,
  #     :group => new_resource.group,
  #     :start_grace_time => new_resource.start_grace_time,
  #     :stop_grace_time => new_resource.stop_grace_time,
  #     :restart_grace_time => new_resource.restart_grace_time,
  #     :mem_usage_mb => new_resource.max_memory_usage_mb,
  #     :cpu_usage_percent => new_resource.max_cpu_usage_percent,
  #     :unicorn_config_path => ::File.join(new_resource.unicorn_directory, "#{new_resource.name}.rb")
  #   )
  #   mode 0644
  #   notifies :restart, resources(:bluepill_service => new_resource.name), :delayed
  # end

  # bluepill_service new_resource.name do
  #   action [:enable, :load, :start]
  # end

  new_resource.updated_by_last_action(true)

end

action :delete do
  # bluepill_service new_resource.name do
  #   action [:disable, :restart]
  # end
  file ::File.join(new_resource.unicorn_directory, "#{new_resource.name}.rb") do
    action :delete
  end
  file ::File.join(node['bluepill']['conf_dir'], "#{new_resource.name}.pill") do
    action :delete
  end
  new_resource.updated_by_last_action(true)
end
