class Event
  include DataMapper::Resource
  property :id, Serial, key: true
  property :venue, String
  property :date, DateTime
  property :description, Text
end

DataMapper.finalize