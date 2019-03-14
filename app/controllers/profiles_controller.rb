class ProfilesController < ApplicationController
  def new 
    @profile = Profile.new
  end
  def create 
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.save
    redirect_to buildings_path
  end 
  def show 
    @profile = current_user.profile
  end 
  private 
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :license, :bill) 
  end  
end 