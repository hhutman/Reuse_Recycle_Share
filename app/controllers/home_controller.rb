class HomeController < ApplicationController 
  def index
    if current_user.buildings.any?
      redirect_to building_path(current_user.buildings.first)
    else 
      redirect_to new_profile_path
    end
  end
end 