class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def already_signed_in
    if current_user
      redirect_to root_url
      flash[:info] = "You are already signed in"
    end
  end
end
