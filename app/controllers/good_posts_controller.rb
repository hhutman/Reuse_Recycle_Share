class GoodPostsController < ApplicationController
  before_action :set_good

def create
  @post = @good.good_posts.new(good_post_params)
  @post.user = current_user
  @post.save
  redirect_to @good
end

private

def set_good
  @good = Good.find(params[:good_id])
end

def good_post_params
  params.require(:good_post).permit(:body)
end
end
