require_relative 'space'

class Booking

  include DataMapper::Resource

  property :id,   Serial
  property :date, String
  property :space_name,String

  # belongs_to :space
end
