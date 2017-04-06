require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, String
  
  def self.create(email, password)
    @user = User.new(email, password)
  end

  def self.instance
    @user
  end

end
