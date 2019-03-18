class HistoriesController < ApplicationController 
  def index
    @goods = current_user.goods
    @services = current_user.services 
  end 
end 