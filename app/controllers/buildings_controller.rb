class BuildingsController < ApplicationController


  def show
  end

  def index
    @buildings = Building.all
  end
end
