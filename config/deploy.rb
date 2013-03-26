require "bundler/capistrano"

set :application, "erichayes"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :user, "root"
set :group, "apache"
set :domain, 'erichayes.net'

set :repository,  "#{user}@#{domain}:repos/#{application}"

server domain, :web, :app, :primary => true

set :deploy_to, "/var/www/rails/#{application}"
set :deploy_via, :remote_cache
set :deploy_env, 'production'

default_run_options[:pty] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# namespace :deploy do
#   namespace :assets do
#     task :precompile, :roles => :app, :except => { :no_release => true } do
#       run <<-CMD.compact
#         cd -- #{latest_release.shellescape} &&
#         #{rake} RAILS_ENV=#{rails_env.to_s.shellescape} #{asset_env} assets:precompile
#       CMD
#     end
#   end
# end

namespace :deploy do
  desc 'Do precompile'
  task :manual_precompile do
    run "cd #{release_path} && RAILS_ENV=production bundle exec rake assets:precompile"
  end
  
  desc 'Gen DB file'
  task :create_db do
    run "cd #{release_path} && RAILS_ENV=production bundle exec rake db:create"
  end
end

after "deploy:update_code", "deploy:manual_precompile"
after "deploy:update_code", "deploy:create_db"