class CountryUsersController < ApplicationController
  def create
    @params = params[:country_user]
    @checkin = CountryUser.where(country_id: @params[:country_id], user_id: current_user.id).first_or_initialize
    @checkin.checked = @params[:checked]
    @checkin.save

    redirect_to root_path
  end

  def update
    @params = params[:country_user]
    @checkin = CountryUser.where(country_id: @params[:country_id], user_id: current_user.id).first_or_initialize
    @checkin.checked = @params[:checked]
    @checkin.save

    redirect_to root_path
  end
end
