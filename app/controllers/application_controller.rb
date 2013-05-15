class ApplicationController < ActionController::Base
  before_filter :require_user
  before_filter :admin_check
  protect_from_forgery

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def require_user
    if current_user
      return true
    end
    flash[:notice] = "Must First Log In!"
    redirect_to root_url
  end

  def admin_check
    if current_user.role == "admin"
      return true
    end
    flash[:notice] = "Not admin!"

    if request.referrer
      redirect_to request.referrer
    else
      redirect_to myCourses_url
    end
  end
end