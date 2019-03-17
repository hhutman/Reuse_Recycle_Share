class BuildingsController < ApplicationController
  before_action :validate_profile

  def show
    @current_user = current_user 
    @building = current_user.buildings.first
    @goods = Good.all
    @goods = @goods.select do |good|
      good.user.buildings.first.id == current_user.buildings.first.id
    end 
    @services = Service.all
    @services = @services.select do |service|
      service.user.buildings.first.id == current_user.buildings.first.id
    end 
    respond_to do |format|
      format.html
      format.json do 
        render json: {
          building: @building,
          goods: @goods,
          services: @services,
          current_user: current_user
        }
      end 
    end
  end
  private
  def validate_profile
    redirect_to new_profile_path if current_user.profile.nil?
  end
end
