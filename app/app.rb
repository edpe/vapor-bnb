ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative './models/user'
# require models here

class VaporBnb < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:sign_up)
  end

  post '/users/new' do
    p ""
    user = User.new(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    user.save
  end

end
