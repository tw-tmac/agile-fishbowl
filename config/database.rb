require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'dm-core'
require 'dm-migrations'
require 'dm-types'
require 'dm-aggregates'

ENV['RACK_ENV'] ||= 'development'

configure :production do
	DataMapper.setup(:default, ENV['DATABASE_URL'])
end

configure :development, :test do
  if ENV['SNAP_CI']
    DataMapper.setup(:default, ENV['SNAP_DB_PG_URL_ALT'])
  else
    settings = YAML::load_file('config/database.yml')
    conn_string = settings[ENV['RACK_ENV']]
    DataMapper.setup(:default, conn_string)
  end
end

require File.expand_path('../models/user', File.dirname(__FILE__))
require File.expand_path('../models/event', File.dirname(__FILE__))
require File.expand_path('../models/subscription', File.dirname(__FILE__))