class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Devise::Controllers::Rememberable

  #def current_user
  #@current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
  #helper_method :current_user



def after_sign_in_remember_me(resource)
  remember_me resource
end

end
