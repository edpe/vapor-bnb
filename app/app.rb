ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative './models/user'
# require models here

class VaporBnb < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:sign_up)
  end

  post '/users/new' do
    user = User.new(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      redirect '/welcome'
    else
      flash[:error] = user.errors.full_messages.join("<br>")
      redirect '/'
    end
  end

  get '/welcome' do
    @user = User.get(session[:user_id])
    erb(:welcome)
  end

end
