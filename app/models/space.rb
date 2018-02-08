require_relative 'user'
require_relative 'booking'

class Space

  include DataMapper::Resource

  belongs_to :user
  # has n, :bookings

  property :id,           Serial
  property :name,         String
  property :description,  String
  property :price,        Integer


end
