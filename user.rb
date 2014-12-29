require 'bcrypt'

$DB_USERNAME = "twer"
$DB_PASSWORD = "Thought01"
$DB_NAME = "agile-fishbowl"
$DB_HOST = "localhost"

$LOCAL_DEV_DATABASE_URL = "postgres://#{$DB_USERNAME}:#{$DB_PASSWORD}@#{$DB_HOST}/#{$DB_NAME}"

DataMapper::Logger.new($stdout, :debug)

#This variable is set through Heroku
if(ENV['DATABASE_URL'].nil?)
  ENV['DATABASE_URL'] = $LOCAL_DEV_DATABASE_URL
end

DataMapper::setup(:default, ENV['DATABASE_URL'])

class User

  include DataMapper::Resource
  property :id, Serial, key: true
  property :username, Text, length: 128
  property :password, BCryptHash

  def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end

end


# perform basic sanity checks and initialize all relationships
# call this once you've defined all your models...
DataMapper.finalize

# create the table
#SMCResponseForm.auto_migrate!
#drop & recreate db
User.auto_upgrade!

# Create a test User
if User.count == 0
  @user = User.create(username: "admin")
  @user.password = "admin"
  @user.save
end
