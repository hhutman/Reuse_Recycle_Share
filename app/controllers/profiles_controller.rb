class ProfilesController < ApplicationController
  def new 
    @profile = Profile.new
    @buildings = Building.all 
  end

  def create 
    profile = Profile.new(profile_params)
    profile.user = current_user
    profile.save

    building = Building.find_by(id: user_building_params[:building_id])
    current_user.update(building: building)

    redirect_to building
  end 
  def show 
    @profile = current_user.profile
  end  
  private 
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :license, :bill, :pic) 
  end  

  def user_building_params
    params.require(:profile).permit(:building_id)
  end 
end 
