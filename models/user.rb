# Sample mapped class

class User
  include Mongoid::Document

  field :email, :type => String
  field :password, :type => Hash
  
end