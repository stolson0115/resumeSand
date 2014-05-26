require 'bundler/capistrano'
# config valid only for Capistrano 3.1
lock '3.2.0'

set :application, 'my_app_name'
set :repo_url, 'git@example.com:me/my_repo.git'
set :application, "tweetni.com" # Your application location on your server goes here

default_run_options[:pty] = true

set :repository,  "."
set :scm, :none
set :deploy_via, :copy

set :checkout, 'export'

set :user, 'username' # Your username goes here
set :use_sudo, false
set :domain, 'tweetni.com' # Your domain goes here
set :applicationdir, "/home/#{user}/#{application}"
set :deploy_to, applicationdir

role :web, domain                 
role :app, domain                          
role :db,  domain, :primary => true 


set :chmod755, "app config db lib public vendor script script/* public/disp*"

namespace :deploy do
  
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
end
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
