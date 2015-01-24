namespace :db do
  require File.expand_path('config/database', File.dirname(__FILE__))

  desc "Migrate the database"
  task :migrate do
    DataMapper.auto_upgrade!
  end

  desc "Upgrade DB schema. THIS WILL DESTROY INFORMATION"
  task :upgrade do
    DataMapper.auto_migrate!
  end

  desc "Add some test users"
  task :seed do
    user = User.new
    user.username = "admin"
    user.password = "admin"
    user.save
  end 
end

  desc "Start shotgun"
  task :shotgun do
    exec "shotgun --host 0.0.0.0 config.ru"
  end 
