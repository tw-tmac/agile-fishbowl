require 'rubygems'
require 'dm-core'

$DB_USERNAME = "twer"
$DB_PASSWORD = "Thought01"
$DB_NAME = "agile-fishbowl"
$DB_HOST = "localhost"

$LOCAL_DEV_DATABASE_URL = "postgres://#{$DB_USERNAME}:#{$DB_PASSWORD}@#{$DB_HOST}/#{$DB_NAME}"

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || $LOCAL_DEV_DATABASE_URL)

require './models/User'

