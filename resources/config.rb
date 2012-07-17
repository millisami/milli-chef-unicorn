def initialize(*args)
  super
  @action = :create
end

actions :create, :delete

attribute :current_path, :kind_of => String, :required => true
attribute :shared_path, :kind_of => String, :required => true

attribute :unicorn_directory, :kind_of => String, :required => false, :default => '/etc/unicorn'
attribute :unicorn_listen, :kind_of => String, :required => false, :default => '/var/run/unicorn/unicorn.socket'
attribute :unicorn_listen_options, :kind_of => Hash, :required => false, :default => {:backlog => 60}
attribute :unicorn_timeout, :kind_of => Fixnum, :required => false, :default => 30
attribute :unicorn_pid, :kind_of => String, :required => false, :default => '/var/run/unicorn/unicorn.pid'
attribute :unicorn_preload_app, :kind_of => [TrueClass, FalseClass], :required => false, :default => true
attribute :unicorn_port, :kind_of => Fixnum, :required => false, :default => 8080

attribute :cow_friendly, :kind_of => [TrueClass, FalseClass], :required => false, :default => false
attribute :user, :kind_of => String, :required => false, :default => 'www-data'
attribute :group, :kind_of => String, :required => false, :default => 'www-data'
attribute :worker_processes, :kind_of => String, :required => false, :default => 1
attribute :preload_app, :kind_of => [TrueClass, FalseClass], :required => false, :default => true

attribute :max_memory_usage_mb, :kind_of => Integer, :required => false, :default => 100
attribute :max_cpu_usage_percent, :kind_of => Integer, :required => false, :default => 20
attribute :environment, :kind_of => String, :required => false, :default => 'production'
attribute :start_grace_time, :kind_of => Fixnum, :required => false, :default => 30
attribute :stop_grace_time, :kind_of => Fixnum, :required => false, :default => 30
attribute :restart_grace_time, :kind_of => Fixnum, :required => false, :default => 60

attribute :template_source, :kind_of => String, :required => false, :default => 'unicorn.app.erb'
attribute :cookbook, :kind_of => String, :required => false, :default => 'unicorn'
