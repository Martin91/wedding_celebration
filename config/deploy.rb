# These configurations is learned from http://guides.beanstalkapp.com/deployments/deploy-with-capistrano.html

require 'capistrano/ext/multistage'
require "rvm/capistrano"
require "bundler/capistrano"

set :application, "Wedding Celebration"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :scm, :git
set :repository,  "git@github.com:Martin91/wedding_celebration.git"
# This command makes Capistrano do a single clone/checkout of your repository on
# your server the first time, then do an svn up or git pull on every deploy
# instead of doing an entire clone/export.
set :deploy_via, :remote_cache

set :stages, %w(staging production)
set :default_stage, 'production'

# If not use use false, will produce error "no tty present and no askpass program specified"
set :use_sudo, false

namespace :db do
  desc "Copy database config file"
  task :copy_database_config, except: { no_release: true }, role: :app do
    run "cp #{shared_path}/config/database.yml #{release_path}/config/"
  end
end

namespace :deploy do
  desc "Touch restart file to make Passenger reload scripts"
  task :touch_restart do
    run "touch #{release_path}/tmp/restart.txt"
  end
end

before "deploy:restart", "deploy:touch_restart"
after "deploy:finalize_update", "db:copy_database_config"

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
