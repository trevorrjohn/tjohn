# frozen_string_literal: true

require 'sinatra'
require 'haml'
require 'sinatra/activerecord'
require './config/environments'
require './models/book'

require './helpers/application_helper'
require './helpers/assets_helper'

get %r{(books\/index\.html|books\z|books\/\z)} do
  js %w(jquery masonry books)
  css %w(books)

  @title = "Books"
  @books = Book.where("url <> ''")

  haml :"books/index"
end

get '/books/view' do
  protected!

  css %w(view)
  js %w(jquery delete_link)

  @title = "All Books"
  @books = Book.all

  haml :"books/view"
end

get '/books/new' do
  protected!

  css %w(books)
  @title = "New Book"

  haml :"books/new"
end

post '/books/create' do
  protected!

  css %w(books)
  Book.create(params[:book])

  redirect to('/books/view'), 303
end

patch '/books/update' do
  protected!

  css %w(books)
  @book = Book.find(params[:id])
  @book.update_attributes(params[:book])

  redirect to('/books/view'), 303
end

get "/books/edit/:id" do
  protected!

  css %w(books)
  @title = "Edit"
  @book = Book.find(params[:id])

  haml :"books/edit"
end

delete "/books/:id" do
  protected!

  Book.find(params[:id]).destroy

  redirect to('/books/view'), 303
end

get "/.well-known/acme-challenge/:id" do
  if params[:id] == "_qm1ea7P3s5IzWYT3SSD0Jpbb4StnRig_rBfamy4FkM"
    "_qm1ea7P3s5IzWYT3SSD0Jpbb4StnRig_rBfamy4FkM" \
      ".yPMLAaCA631RGsUf745CqXh--yYi0-WAIgur-1U6l7o"
  elsif params[:id] == "9XAySknZJCPSWtKf8v6xpT122m6IzUAr4TmcjoFxusA"
    "9XAySknZJCPSWtKf8v6xpT122m6IzUAr4TmcjoFxusA" \
      ".yPMLAaCA631RGsUf745CqXh--yYi0-WAIgur-1U6l7o"
  elsif params[:id] == "EX8aEXcmm34_mY_3yE4Q78tjdKRawMooBd-Diozz8xs"
    "EX8aEXcmm34_mY_3yE4Q78tjdKRawMooBd-Diozz8xs" \
      ".yPMLAaCA631RGsUf745CqXh--yYi0-WAIgur-1U6l7o"
  elsif params[:id] == "qnZHLZeUYL6Q60Ij9mSussHYyrOnbWr8scox6mIdMg0"
    "qnZHLZeUYL6Q60Ij9mSussHYyrOnbWr8scox6mIdMg0" \
      ".yPMLAaCA631RGsUf745CqXh--yYi0-WAIgur-1U6l7o"
  end
end

get '/*' do
  css %w(main)
  @title = "Home"

  haml :index
end

not_found do
  status 404
  'not found'
end
