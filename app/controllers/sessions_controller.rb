class SessionsController < ApplicationController
  before_action :already_signed_in, only: [:new]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) ||
      lec = Lecturer.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) || 
     lec && lec.authenticate(params[:session][:password]) 
      if user.activated? || lec.activated?
        log_in user || lec
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user || lec
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
