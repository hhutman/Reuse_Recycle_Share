class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    if current_user.profile.nil? 
      new_profile_path
    else 
      buildings_path
    end
  end
end
