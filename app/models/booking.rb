require_relative 'space'

class Booking

  include DataMapper::Resource

  belongs_to :space, :required => false

  property :id,   Serial
  property :date, String
  property :confirmed, Boolean, :default => false

  def confirm
    self.update(:confirmed => true)
  end

end
