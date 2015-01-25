class Subscription
  include DataMapper::Resource
  property :id, Serial, key: true
  property :email, String
end

DataMapper.finalize