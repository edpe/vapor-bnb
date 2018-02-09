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

# main pages

  get '/' do
    erb(:sign_up)
  end

  get '/welcome' do
    @user = current_user
    erb(:welcome)
  end

# users

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

# spaces

  get '/spaces/new' do
    erb (:'spaces/new')
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:'spaces/index')
  end

  post '/spaces' do
    space = Space.new(name: params[:name], description: params[:description],
                      price: params[:price])
    space.user = current_user
    if space.save
      redirect '/spaces'
    else
      redirect '/spaces/new'
    end
  end

  get '/spaces/:id' do
    session[:space_id] = params[:id]
    @space = current_space
    erb(:'bookings/new')
  end

# bookings

  get '/bookings/new' do
    erb(:'bookings/new')
  end

  post '/bookings' do
    booking = Booking.new(date: params[:date])
    booking.space = current_space
    booking.user = current_user
    if booking.save
      puts "Booking saved successfully"
    end
  end

# customer stuff

  get '/customer/bookings' do

  end

# host stuff

  get '/host/space_management' do
    erb(:'spaces/manage')
  end

  get '/bookings/manage' do
    # @spaces = current_user.spaces
    @bookings = current_user.spaces.bookings
    erb(:'bookings/manage')
  end

  get '/bookings/confirm/:id' do
    session[:booking_id] = params[:id]
    current_booking.confirm
    erb(:'bookings/confirm')
  end

  # get '/host/bookings_management' do
  #
  # end

# helpers

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def current_space
      @current_space ||= Space.get(session[:space_id])
    end

    def current_booking
      @current_booking ||= Booking.get(session[:booking_id])
    end
  end

end
