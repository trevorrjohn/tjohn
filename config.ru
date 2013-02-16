require './app'
require 'haml'
require 'sinatra/activerecord'
require './config/environments'

run Sinatra::Application
