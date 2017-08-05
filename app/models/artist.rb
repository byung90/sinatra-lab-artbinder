class Artist < ActiveRecord::Base
  belongs_to :users
  has_many :works
end
