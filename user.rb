require 'bcrypt'
class User

  include DataMapper::Resource
  property :id, Serial
  property :username, Text
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
