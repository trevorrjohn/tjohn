require 'sinatra'
require 'haml'
require 'sinatra/activerecord'
require './config/environments'
require './models/book'

require './helpers/application_helper'
helpers HTTPAuth

get %r{(books\/index\.html|books\z|books\/\z)} do
  @title = "Books"
  @books = Book.all

  haml :"books/index"
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

post '/update' do
  protected!

  @book = Book.find(params[:id])
  @book.update_attributes(params[:book])

  redirect to('/view'), 303
end

get "/edit/:id" do
  protected!

  @title = "Edit"
  @book = Book.find(params[:id])

  haml :edit
end

get '/*' do
  @title = "Home"

  haml :index
end

not_found do
  status 404
  'not found'
end
