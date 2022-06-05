require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'
set :bind, '0.0.0.0'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

# the instance variables defined in the Controller, and they'll be automatically passed to the view
get '/' do
  @usernames = %w[ssaunier Papillard]
  erb :index
end

get '/about' do
  erb :about
end

# you can pass parameters from the URL to the controller in app.rb
get '/team/:username' do
  puts params[:username]
  "The username is #{params[:username]}"
end
