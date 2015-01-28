require 'spec_helper'

describe 'AppController' do

  describe "GET '/'" do
    it "loads homepage" do
      get '/'
      expect(last_response).to be_ok
    end

    it "displays hompage content" do
      get '/'
      #Scene 1, act 1, story #4, uncomment this line to fail the test and build
      #expect(last_response.body).to include("fail!")
      expect(last_response.body).to include("The next upcoming geek night is on")
    end
  end

  describe "GET /admin/event" do
	before :each do
	  post "/auth/login", {:username => "admin", :password => "admin"}
	end

  	 it "login succesful" do
  	 	get '/'
     	expect(last_response.body).to include("Admin")
     end

      it "access to admin page" do
		get '/admin/event'
      	expect(last_response.body).to include("Add new event")
    end
  end
 end