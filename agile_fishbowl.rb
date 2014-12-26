require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-timestamps'
require 'dm-postgres-adapter'
require 'dm-migrations'
#we'll need it later on for email
#require 'pony'
require 'dm-types'

$DB_USERNAME = "twer"
$DB_PASSWORD = "Thought01"
$DB_NAME = "agile-fishbowl"
$DB_HOST = "localhost"

$DATABASE_URL = "postgres://#{$DB_USERNAME}:#{$DB_PASSWORD}@#{$DB_HOST}/#{$DB_NAME}"
DataMapper::Logger.new($stdout, :debug)
DataMapper::setup(:default, $DATABASE_URL)

require './user'

get '/' do
  erb :index
end

set :bind, '0.0.0.0'
