require_relative 'space'

class Booking

  include DataMapper::Resource

  belongs_to :space, :required => false
  belongs_to :user

  property :id,        Serial
  property :date,      Date
  property :confirmed, Boolean, :default => false

  def confirm
    self.update(:confirmed => true)
  end

end
