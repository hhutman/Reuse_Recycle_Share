class ProfilesController < ApplicationController
  def show 
    @profile = Profile.find(params[:id])
  end 
  def new 
    @profile = Profile.new 
  end 
  def create 
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.save
  end 
  
  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name)
  end
end 