ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative './models/booking'
require_relative './models/space'
require_relative './models/user'
# require models here
# test change

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
    @user = current_user
    erb(:welcome)
  end

  get '/spaces/new' do
    erb (:'spaces/new')
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:'spaces/index')
  end

  post '/spaces' do
    space = Space.new(name: params[:name], description: params[:description], price: params[:price])
    space.user = current_user
    if space.save
      redirect '/spaces'
    else
      redirect '/spaces/new'
    end
  end

  get '/bookings/new' do
    erb(:'bookings/new')
  end

  post '/bookings' do
    Booking.create()
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
