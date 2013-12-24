require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/mysql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"

server "trendersng.tk", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "trenders"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :repository,  "git@github.com:verygreenboi/trenders.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# if you want to clean up old releases on each deploy uncomment this:
after "deploy", "deploy:cleanup" # keep only the last 5 releases