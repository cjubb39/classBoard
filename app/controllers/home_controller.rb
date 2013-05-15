class HomeController < ApplicationController
  skip_before_filter :require_user
  skip_before_filter :admin_check

  def index
  end
end
