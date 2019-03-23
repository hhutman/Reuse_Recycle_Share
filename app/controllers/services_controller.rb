class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /services
  # GET /services.json
  def index
    @services = Service.where(user: current_user.building.users)
    if params[:search].present?
      @services = @services.where("description = ? OR more_information = ?", params[:search], params[:seach])
    end
    respond_to do |format|
      format.html 
      format.json do 
        render json: {
          services: @services.map{|s|s.attributes.merge(image: url_for(s.user.profile.pic), ownerId: s.user.id)}
        }
      end
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @services = Service.where(user: current_user.building.users)
    respond_to do |format| 
      format.html 
      format.json do 
        render json: @services
      end 
    end 
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    # service = params[:service]
    # @service = Service.new(description: service[:description], availablity: service[:availability], more_information: service[:more_information])
    @service = Service.new(service_params)
    @service.user = current_user 
    @service.save
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    @service.update(service_params)
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:description, :more_information, :pic)
    end
end
