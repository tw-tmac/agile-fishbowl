namespace :db do
  require 'rubygems'
  require 'sinatra'
  require 'dm-core'
  require 'dm-migrations'
  require 'dm-types'
  require 'dm-aggregates'
  require './config/database'

  #THIS WILL DESTROY THE DATABASE!
  desc "Migrate the database"
  task :migrate do
    DataMapper.auto_migrate!
  end

  desc "Upgrade the database schema"
  task :upgrade do
    DataMapper.auto_upgrade!
  end
  
  desc "Add some test users"
  task :testusers do

    user = User.new
    user.username = "admin"
    user.password = "admin"
    user.save
 
  end    
end

namespace :deploy do
  desc 'Deploy the app to Heroku'
  task :production do
    app = "bc-geeknight"
    remote = "git@heroku.com:#{app}.git"

    system "heroku maintenance:on --app #{app}"
    system "git push #{remote} master"
    system "heroku run rake db:upgrade --app #{app}"
    system "heroku maintenance:off --app #{app}"
  end

  desc 'Run the app locally'
  task :local do
    system "shotgun config.ru"
  end
end