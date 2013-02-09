source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', github: 'rails/rails'
gem 'haml-rails', github: 'indirect/haml-rails'

gem 'pg'

group :production do
  gem 'unicorn'
end

group :assets do
  gem 'sass-rails', github: 'rails/sass-rails'
  gem 'uglifier'
end

group :test, :development do
  gem 'pry'
end
