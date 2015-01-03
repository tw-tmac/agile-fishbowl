require 'bundler'
require 'yaml'
Bundler.require

require './config/database'

enable :sessions

 class AgileFishbowl < Sinatra::Base

 	register Sinatra::Flash
	
	#set security
	set :sessions, key: 'N&wedhSDF',
	  expire_after: 14400,
	  secret: '*&(^B234'

	  use Warden::Manager do |config|
	    config.serialize_into_session{|user| user.id }
	    config.serialize_from_session{|id| User.get(id) }

	    config.scope_defaults :default,
	      strategies: [:password],
	      action: 'auth/unauthenticated'

	    config.failure_app = self
	  end

	  Warden::Manager.before_failure do |env,opts|
	    env['REQUEST_METHOD'] = 'POST'
	  end

	  Warden::Strategies.add(:password) do
	    def valid?
	      params['user'] && params['user']['username'] && params['user']['password']
	    end

	    def authenticate!
	    	
	      user = User.first(username: params['user']['username'])

	      if user.nil?
	        fail!("The username you entered does not exist.")
	      elsif user.authenticate(params['user']['password'])
	        success!(user)
	      else
	        fail!("Could not log in")
	      end
	    end
	  end


	get '/' do
	  erb :index
	end

	post '/auth/login' do
	    env['warden'].authenticate!
	    flash[:success] = "Login ok!"
	    redirect "/"
	end

	  get '/logout' do
	    env['warden'].raw_session.inspect
	    env['warden'].logout
	    redirect '/'
	  end

	post '/auth/unauthenticated' do
	    session[:return_to] = env['warden.options'][:attempted_path] if session[:return_to].nil?
	    flash[:error] = "Invalid username or password"
	    redirect '/'
 	end

 	get '/admin/event' do
 		if env['warden'].authenticated?
 			erb :event
 		else
 			flash[:error] = "Please login"
 			redirect '/'
 		end
 	end
#binding to any port useful for the vagrant box
	set :bind, '0.0.0.0'

end