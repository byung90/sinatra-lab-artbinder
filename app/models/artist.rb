class Artist < ActiveRecord::Base
  belongs_to :users
  has_many :works

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end
  
end
