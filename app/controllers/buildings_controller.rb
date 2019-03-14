class BuildingsController < ApplicationController
  before_action :validate_profile

  def show
  end

  def index
    @buildings = Building.all
  end
  private
  def validate_profile
    redirect_to new_profile_path if current_user.profile.nil?
  end
end
