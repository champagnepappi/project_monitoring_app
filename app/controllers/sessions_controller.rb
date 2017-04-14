class SessionsController < ApplicationController
  before_action :already_signed_in, only: [:new]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) ||
      lec =  Lecturer.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) ||
     lec && lec.authenticate(params[:session][:password]) 
      if user.activated? 
        log_in user 
        params[:session][:remember_me] == '1' ? remember(user) : forget(user) 
        redirect_back_or user 
      elsif lec.activated?
        log_in lec
        params[:session][:remember_me] == '1' ? remember(lec) : forget(lec) 
        redirect_back_or lec 
      else
        message = "Account not activated"
        message += "Check your email for activation link"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
