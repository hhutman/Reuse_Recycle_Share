class ShareablesController < ApplicationController
  def new
    @shareables = Shareable.all
  end

  def create
  end
end
