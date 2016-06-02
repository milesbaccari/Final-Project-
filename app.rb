require 'sinatra'
require 'sinatra/activerecord'

configure (:development) {set :database, {adapter: "sqlite3", database: "sinatraDatabase.sqlite3" }}

require './models.rb'

get '/' do 
	erb :index
end 

get '/sign-in' do 
	erb :sign_in
end 

post '/sign-in-process' do 
	@username = params[:username]
	@password = params[:password]
	redirect('/welcome?username=#{@username}')
end 

get '/welcome' do 
	@username = params[:username]
	erb :welcome
end 

