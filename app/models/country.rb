class Country < ActiveRecord::Base
  attr_accessible :name

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
end
