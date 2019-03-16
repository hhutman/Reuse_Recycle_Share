class BuildingsController < ApplicationController
  before_action :validate_profile

  def show
    @current_user = current_user 
    @building = current_user.buildings.first
    @goods = Building.goods
    @service = Building.services
  end
  private
  def validate_profile
    redirect_to new_profile_path if current_user.profile.nil?
  end
end
