class User < ActiveRecord::Base
  has_many :artists
  has_many :works, :through => :artists

  has_secure_password


end
