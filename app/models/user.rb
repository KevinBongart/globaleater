class User < ActiveRecord::Base
  attr_accessible :email
  attr_accessible :first_name
  attr_accessible :image
  attr_accessible :last_name
  attr_accessible :location
  attr_accessible :name
  attr_accessible :nickname
  attr_accessible :oauth_expires_at
  attr_accessible :oauth_token
  attr_accessible :provider
  attr_accessible :uid

  has_many :country_users
  has_many :checkins, :through => :country_users

  def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.email = auth.info.email
        user.first_name = auth.info.first_name
        user.image = auth.info.image
        user.last_name = auth.info.last_name
        user.location = auth.info.location
        user.name = auth.info.name
        user.nickname = auth.info.nickname
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.oauth_token = auth.credentials.token
        user.provider = auth.provider
        user.uid = auth.uid
        user.save!
      end
    end
end
