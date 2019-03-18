class ProfilesController < ApplicationController
  def new 
    @profile = Profile.new
    @buildings = Building.all 
  end
  def create 
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.save
    @user_building = UserBuilding.new(building_id: user_building_params)
    @user_building.user = current_user
    @user_building.save
    building = @user_building.building
    redirect_to building_path(building)
  end 
  def show 
    @profile = current_user.profile
  end  
  private 
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :license, :bill) 
  end  
  def user_building_params 
    params[:profile][:building_id]
  end 
end 