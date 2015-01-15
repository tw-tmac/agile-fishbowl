class Event

  include DataMapper::Resource
  property :id, Serial, key: true
  property :name, String
  property :date, DateTime
  property :description, Text
end