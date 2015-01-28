#ENV['RACK_ENV'] = 'test'

require 'sinatra'
require "sinatra/base"
require 'rack/test'
require File.expand_path('../agile_fishbowl', File.dirname(__FILE__))

def app
  AgileFishbowl.new
end

def session
  last_request.env['rack.session']
end

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
  config.include Rack::Test::Methods
end
