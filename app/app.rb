ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative './models/space'
# require models here

class VaporBnb < Sinatra::Base

  enable :sessions

  get '/spaces/new' do
    erb (:'spaces/new')
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:'spaces/index')
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], price: params[:price])
    # p params
    redirect '/spaces'
  end

end
