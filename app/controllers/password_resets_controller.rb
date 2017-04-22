class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase) 
      # Lecturer.find_by(email: params[:password_reset][:lec_email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update 
    if password_blank?
      flash.now[:danger] = "Password can't be blank"
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password successfully reset"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    if params.has_key? :user
      params.require(:user).permit(:password, :password_confirmation)
    else
      params.require(:lecturer).permit(:password, :password_confirmation)
    end
  end

  def get_user
    @user = User.find_by(email: params[:email])
     # Lecturer.find_by(email: params[:lec_email])
  end

  def valid_user
    unless (@user && @user.activated? && 
            @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  def password_blank?
    if params.has_key? :user
      params[:user][:password].blank?
    else
      params[:lecturer][:password].blank?
    end
  end

  def check_expiration
    if @user.password_reset_expired? 
      flash[:danger] = "Password reset expired"
      redirect_to new_password_reset_url
    end
  end
end
