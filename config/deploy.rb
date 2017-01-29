# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'arabicJP'
set :repo_url, 'git@github.com:torikichi/arabicJP.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
 set :deploy_to, '/var/www/milaaha/arabicJP'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# capistrano3-puma の既定の再起動処理を無効化
set :puma_default_hooks, false
# puma を capistrano で利用するための設定
set :puma_preload_app, false
set :prune_bundler, true

# Default value for :linked_files is []
append :linked_files, 'config/puma.rb', 'config/database.yml', 'config/secrets.yml', 'config/environments/production.rb', 'Gemfile', 'Gemfile.lock'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

set :rbenv_ruby, '2.3.0'

task :restart do
  on roles(:app) do
    # Your restart mechanism here, for example:
    # execute :touch, release_path.join('tmp/restart.txt')
    invoke 'puma:phased-restart'
  end
end