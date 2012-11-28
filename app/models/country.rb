class Country < ActiveRecord::Base
  attr_accessible :name

  has_many :country_users
  has_many :checkins, :through => :country_users

  def yelp_results(city, country)
    client = Yelp::Client.new

    request = Yelp::V2::Search::Request::Location.new(
      city: city,
      term: "#{country} restaurant",
      consumer_key: Figleaf::Settings.yelp.consumer_key,
      consumer_secret: Figleaf::Settings.yelp.consumer_secret,
      token: Figleaf::Settings.yelp.token,
      token_secret: Figleaf::Settings.yelp.token_secret
    )

    HashWithIndifferentAccess.new(client.search(request))
  end

  def checkin_for(user)
    country_users.where(user_id: user.id).first_or_initialize
  end
end
