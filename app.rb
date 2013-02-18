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

get '/books/view' do
  protected!

  @title = "All Books"
  @books = Book.all

  haml :"books/view"
end

get '/books/new' do
  protected!

  @title = "New Book"

  haml :"books/new"
end

post '/books/create' do
  protected!

  Book.create(params[:book])

  redirect to('/books/view'), 303
end

post '/books/update' do
  protected!

  @book = Book.find(params[:id])
  @book.update_attributes(params[:book])

  redirect to('/books/view'), 303
end

get "/books/edit/:id" do
  protected!

  @title = "Edit"
  @book = Book.find(params[:id])

  haml :"books/edit"
end

get '/*' do
  @title = "Home"

  haml :index
end

not_found do
  status 404
  'not found'
end
