require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password

  property :id,                Serial
  property :email,             String
  property :password_hash,     Text
  property :name,              String
  property :username,          String

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

end
