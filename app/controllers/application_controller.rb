class ApplicationController < ActionController::Base
  before_filter :require_user
  protect_from_forgery

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def require_user
    if current_user
      return true
    end
    redirect_to root_url, :notice => "Must First Login"
  end

end