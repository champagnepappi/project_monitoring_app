class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email]) 
      lec = Lecturer.find_by(email: params[:lec_email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated"
      redirect_to user
    elsif lec && !lec.activated? && lec.authenticated?(:activation, params[:id])
      lec.activate
      login lec
      flash[:success] = "Account activated"
      redirect_to lec
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end
