require_relative 'space'

class Booking

  include DataMapper::Resource

  # has 1, :space, :required => false
  belongs_to :space, :required => false

  property :id,   Serial
  property :date, String

end
