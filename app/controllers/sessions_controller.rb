class SessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      session[:user_id] = user.id
      session[:user] = user
      redirect_to courses_path
    else
      flash[:notice] = "Enter valid info"
      render "new"
    end  
  end

  def destroy
    session[:user_id] = nil
    session[:user] = nil
    redirect_to root_url
  end

end