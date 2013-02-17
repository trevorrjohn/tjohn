require 'sinatra'
require 'haml'
require 'sinatra/activerecord'
require './config/environments'
require './models/book'

require './helpers/application_helper'
helpers HTTPAuth

get '/books' do
  @title = "Books"
  @books = Book.all

  haml :books
end

get '/view' do
  protected!

  @title = "All Books"
  @books = Book.all

  haml :view
end
get '/new' do
  protected!

  @title = "New Book"

  haml :new
end

post '/create' do
  protected!

  Book.create(params[:book])

  redirect to('/view'), 303
end

get '/*' do
  @title = "Home"

  haml :index
end

not_found do
  status 404
  'not found'
end
