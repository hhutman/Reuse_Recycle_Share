class BuildingsController < ApplicationController
  before_action :validate_profile

  def show
    @building = Building.find(params[:id])
    users     = @building.users

    if params[:term].present?
      goods     = Good.where(user: users)
      services  = Service.where(user: users)
      goods = goods.where("description ilike ?", "%#{params[:term]}%")
      services = services.where("description ilike ?", "%#{params[:term]}%")
    else
      goods = []
      services = []
    end

    respond_to do |format|
      format.html
      format.json do
        render json: {
          building:     @building,
          goods:        goods,
          services:     services,
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
