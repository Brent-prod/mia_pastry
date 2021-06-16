require 'sinatra'     
require 'sinatra/reloader' if development?
require 'pg'

enable :sessions

require_relative 'db/db'
require_relative 'models/cake'
require_relative 'models/user'
require_relative 'helpers/sessions_helper'
require_relative 'controllers/cakes_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'


get '/' do
  erb :index
end

# get '/login' do
#   erb :login
# end

# get '/signup' do
#   erb :signup
# end

# # get '/display' do
# #   erb :display
# # end

# get '/create' do
#   erb :create
# end

# get '/edit' do
#   erb :edit
# end