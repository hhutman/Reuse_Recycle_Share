class ServicePostsController < ApplicationController
  before_action :set_service

def create
  @post = @service.service_posts.new(service_post_params)
  @post.user = current_user
  @post.save
  redirect_to @service
end

private

def set_service
  @service = Service.find(params[:service_id])
end

def service_post_params
  params.require(:service_post).permit(:body)
end
end
