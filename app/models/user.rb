require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,                Serial
  property :email,             String, required: true, unique: true
  property :password_hash,     Text,   required: true
  property :name,              String, required: true
  property :username,          String, required: true, unique: true

  validates_confirmation_of :password
  validates_format_of       :email, as: :email_address

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

end
