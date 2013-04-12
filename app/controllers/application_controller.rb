class ApplicationController < ActionController::Base
  before_filter :require_user
  protect_from_forgery

  def current_user
    if @current_user.nil?
      @current_user = User.find(session[:user_id]) if session[:user]
    end

    #if @current_user.nil?
    #	return false
    #else
    #	return true
    #end
  end
  helper_method :current_user
  
  def require_user
    if current_user
      return true
    end
    redirect_to root_url
  end

end