require "securerandom"

default[:rails][:ruby][:version] = "1.9.1"  # include ruby/recipes/{ver}.rb
default[:languages][:ruby][:default_version] = node[:rails][:ruby][:version]

default[:rails][:app][:name] = "rails_app" # must be one word
default[:rails][:app][:path] = "/var/www/projects/#{node[:rails][:app][:name]}"
default[:rails][:app][:environment] = "production"

default[:rails][:owner] = "deploy"
default[:rails][:group] = "deploy"
default[:rails][:packages] = []
default[:rails][:gems] = []

default[:rails][:deploy][:type] = "git" # only git is supported at the moment
default[:rails][:deploy][:ssh_key] = nil
default[:rails][:deploy][:shallow_clone] = true
default[:rails][:deploy][:repository] = nil
default[:rails][:deploy][:revision] = "master"
default[:rails][:deploy][:enable_submodules] = true
default[:rails][:deploy][:action] = :deploy # can be :deploy or :force_deploy

default[:rails][:deploy][:precompile_assets] = nil # true or false
default[:rails][:deploy][:database_master_role] = nil # used when rendering the `database.yml` file for the host
default[:rails][:deploy][:database_template] = nil # nil means database.yml.erb will be used
default[:rails][:deploy][:bundler] = true
default[:rails][:deploy][:bundle_command] = "/usr/local/bin/bundle"
default[:rails][:deploy][:bundler_deployment] = true
default[:rails][:deploy][:bundler_without_groups] = []

default[:rails][:deploy][:purge_before_symlink] = []
default[:rails][:deploy][:create_dirs_before_symlink] = []
default[:rails][:deploy][:symlinks] = {}
default[:rails][:deploy][:symlink_before_migrate] = {}

default[:rails][:deploy][:migrate] = false
default[:rails][:deploy][:migration_command] = "/usr/local/bin/bundle exec rake db:migrate"
# TODO: change to command for restarting unicorn
default[:rails][:deploy][:restart_command] = nil # unicorn provider sets this

default[:rails][:database][:type] = "mysql" # or postgresql
default[:rails][:database][:host] = "127.0.0.1"
default[:rails][:database][:port] = nil     # use default port for mysql/postgresql
default[:rails][:database][:adapter] = "mysql2" # node[:rails][:database][:type]
default[:rails][:database][:name] = node[:rails][:app][:name]
default[:rails][:database][:username] = node[:rails][:app][:name]
default[:rails][:database][:password] = node[:rails][:database][:password]  || ::SecureRandom.base64(12)
default[:rails][:database][:root_password] = nil # set by mysql/postgresql cookbooks to securerandom

default[:rails][:nginx][:application_port] = 8080
default[:rails][:nginx][:port] = 80
default[:rails][:nginx][:template] = "load_balancer.conf.erb"
default[:rails][:nginx][:server_name] = node['fqdn']
default[:rails][:nginx][:static_files] = {}
default[:rails][:nginx][:ssl] = false
default[:rails][:nginx][:ssl_certificate] = "#{node['fqdn']}.crt"
default[:rails][:nginx][:ssl_certificate_key] = "#{node['fqdn']}.key"

default[:rails][:unicorn][:worker_processes] = [node['cpu']['total'].to_i * 4, 8].min
default[:rails][:unicorn][:worker_timeout] = 60
default[:rails][:unicorn][:preload_app] = false
default[:rails][:unicorn][:before_fork] = 'sleep 1'
default[:rails][:unicorn][:port] = node[:rails][:nginx][:application_port].to_s # must be a string
default[:rails][:unicorn][:bundler] = node[:rails][:deploy][:bundler]
default[:rails][:unicorn][:bundle_command] = node[:rails][:deploy][:bundle_command]
default[:rails][:unicorn][:unicorn_bin] = "unicorn_rails"
default[:rails][:unicorn][:unicorn_config] = "/etc/unicorn/#{node[:rails][:app][:name]}.rb"
