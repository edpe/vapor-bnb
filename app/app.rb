ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative './models/space'
# require models here

class VaporBnb < Sinatra::Base

  enable :sessions

  get '/spaces/new' do
    erb :'spaces/new'
  end

end
