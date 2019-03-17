class HomeController < ApplicationController 

  def index
    if current_user 
      redirect_to building_path(current_user.buildings.first)
    else 
      redirect_to 'users/sign_in'
    end  
  end
end 