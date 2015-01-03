require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-migrations'
require 'dm-types'
require 'dm-aggregates'

ENV['RACK_ENV'] ||= 'development'

configure :production do
	DataMapper.setup(:default, ENV['DATABASE_URL'])	
end

configure :development, :test do
	settings = YAML::load_file('config/database.yml')
	conn_string = settings[ENV['RACK_ENV']]
	DataMapper.setup(:default, conn_string)
end

require './models/User'

