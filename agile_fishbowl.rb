require 'rubygems'
require 'sinatra'
#require 'sinatra_more' # glob all sinatra_more 
#require 'sinatra_more/markup_plugin' # or require 'sinatra_more/markup_plugin' for precise inclusion
require 'haml'
#require 'datamapper'
require 'dm-core'
require 'dm-timestamps'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'pony'
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
	@var = "This is a variable from somewhere else"
  haml :index
end

get '/about' do
  haml :about
end

set :bind, '0.0.0.0'
