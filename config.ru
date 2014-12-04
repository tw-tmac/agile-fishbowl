path = File.expand_path("../", __FILE__)

require 'rubygems'
require 'sinatra'
require "#{path}/agile_fishbowl"

run Sinatra::Application
