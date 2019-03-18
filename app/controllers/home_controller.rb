class HomeController < ApplicationController 
  def index
    if current_user.building
      redirect_to current_user.building
    else 
      redirect_to new_profile_path
    end
  end
end 