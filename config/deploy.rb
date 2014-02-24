set :application, "donation"
set :repository,  "git@bitbucket.org:dorren/salespy_frontend.git"
set :stages, %w(qa production)
set :default_stage, "production"
require 'capistrano/ext/multistage'

#set :whenever_environment, defer { stage }
#require "whenever/capistrano"

set :scm, :git
set :branch, "master"
set :ssh_options, { :forward_agent => true }
set :deploy_via, :remote_cache
set :git_enable_submodules, 1
set :copy_cache, false
set :use_sudo, false
set :keep_releases, 3

set :user, "deployer"
set :runner, "deployer"
set :server_name, "localhost"
set(:rails_env) { stage }
set(:deploy_to) { "/var/www/#{application}/#{stage}" }
set :bundle_without, [:development, :test]
set :bundle_flags, "--deployment "

role(:web) { "#{server_name}" } 
role(:app) { "#{server_name}" }
role(:db)  { Capistrano::ServerDefinition.new("#{server_name}", :primary => true) }


namespace :deploy do
  task :start do ; end
  task :stop do ; end

  desc "restart unicorn, by stop and start"
  task :unicorn_reload, :roles => :app do
    top.unicorn.shutdown
    sleep 2
    top.unicorn.start
  end
end

#before 'deploy:restart', 'deploy:migrate'
after  'deploy',         'deploy:cleanup'

require "rvm/capistrano"
require "bundler/capistrano"
require File.expand_path('../capistrano_unicorn', __FILE__)
after "deploy:restart", "deploy:unicorn_reload"
