namespace :db do
  require File.expand_path('config/database', File.dirname(__FILE__))


  #THIS WILL DESTROY THE CURRENT DATA!
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