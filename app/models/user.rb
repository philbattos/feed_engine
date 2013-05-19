class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username,
                  :avatar

  has_many :auth_sources
  has_many :trips
  has_many :tweets
  has_many :notes
  has_many :photos
  has_many :check_ins

  validates :username, :presence => true,
                       :uniqueness => true

  def instagram_connected?
    auth_sources.collect{|a| a.provider}.include?("instagram")
  end

  def foursquare_connected?
    auth_sources.collect{|a| a.provider}.include?("foursquare")
  end
end
