require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-migrations'
require 'dm-types'
require 'dm-aggregates'

namespace :db do
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