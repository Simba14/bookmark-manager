require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String

  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
end
