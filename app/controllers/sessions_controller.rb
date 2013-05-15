class SessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]
  skip_before_filter :admin_check

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])\
      #Application.current_user
      session[:user_id] = user.id
      session[:user_slug] = user.slug
      redirect_to myCourses_path, :notice => 'Logged in!'
    else
      flash[:error] = "Enter valid log in info!"
      render "new"
    end  
  end

  def destroy
    session[:user_id] = nil
    session[:user_slug] = nil
    @current_user = nil

    flash[:notice] = "Logged out!"
    redirect_to root_url
  end

end
