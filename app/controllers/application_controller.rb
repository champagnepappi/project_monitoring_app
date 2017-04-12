class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def already_signed_in
    if current_user || current_lec
      redirect_to root_url
      flash[:info] = "You are already signed in"
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please login to continue"
      redirect_to login_url
    end
  end
end
