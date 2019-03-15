class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    if current_user.profile.nil? 
      new_profile_path
    elsif current_user.profile && current_user.buildings.any?
      building_path(current_user.buildings.first)
    else 
      redirect_to new_profile_path
    end
  end
end
