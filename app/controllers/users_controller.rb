class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update]
  before_action :already_signed_in, only: [:new]


  def index
    @users = User.all
    @user = current_user && current_user.admin? 
      @lec = current_lec && current_lec.admin?
      # @supv = Lecturer.find_by(id: params[:supervisor])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @projects = @user.projects.approved
    @messages = @user.messages
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def assign
    student = User.find_by(id: params[:user_id])
    lec = Lecturer.find_by(id: params[:supervisor])
    student.update_attribute(:status, params[:status])
    lec.update_attribute(:status, params[:lec_status])
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :reg_no, :gender, :department, :password, 
                                :password_confirmation)
  end


  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
