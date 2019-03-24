class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token


  # GET /goods
  # GET /goods.json
  def index
    @goods = Good.where(user: current_user.building.users)
    respond_to do |format|
      format.html
      format.json do 
        render json: {
          goods: @goods.map{|g|g.attributes.merge(image: url_for(g.user.profile.pic), ownerId: g.user.id)}
        }
      end
    end 
  end

  # GET /goods/1
  # GET /goods/1.json
  def show
  end

  # GET /goods/new
  def new
    @good = Good.new
  end

  # GET /goods/1/edit
  def edit
   

  end

  # POST /goods
  # POST /goods.json
  def create
    @good = Good.new(good_params)
    @good.user = current_user
    @good.save
  end

  # PATCH/PUT /goods/1
  # PATCH/PUT /goods/1.json
  def update
    @good.update(good_params)
  end

  # DELETE /goods/1
  # DELETE /goods/1.json
  def destroy
    @good.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_good
      @good = Good.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def good_params
      params.require(:good).permit(:description, :more_information, :pic)
    end
end
