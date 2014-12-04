require 'bundler'

Bundler.require

get '/' do
	@var = "This is a variable from somewhere else"
  haml :index
end

get '/about' do
  haml :about
end
