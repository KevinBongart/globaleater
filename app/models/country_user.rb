class CountryUser < ActiveRecord::Base
  attr_accessible :checked, :country_id, :user_id

  belongs_to :country
  belongs_to :user
end
