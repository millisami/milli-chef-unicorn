## Description

Installs unicorn to run Rack apps.

### Usage

    unicorn_config 'my_rails3app' do
      preload_app node[:app][:preload]
      worker_processes node[:app][:workers]
      start_grace_time node[:bluepill][:start_grace_time]
      stop_grace_time node[:bluepill][:stop_grace_time]
      restart_grace_time node[:bluepill][:restart_grace_time]
      max_memory_usage_mb node[:bluepill][:mem_usage_mb]
      max_cpu_usage_percent node[:bluepill][:cpu_usage_percent]
    end


## Requirements

* Add `gem 'unicorn'` in your app's `Gemfile`
* Must be a Rack app

