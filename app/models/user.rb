class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username, :avatar

  has_many :auth_sources

  validates :username, :presence => true,
                       :uniqueness => true

end
