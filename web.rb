require 'sinatra'
require 'haml'

get '/*' do
  haml :index
end

not_found do
  status 404
  'not found'
end
