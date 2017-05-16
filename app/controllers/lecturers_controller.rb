class LecturersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :correct_lec, only: [:edit, :update]
  before_action :already_signed_in, only: [:new]

  def index
    @lecturers = Lecturer.all
  end

  def new
    @lec = Lecturer.new
  end

  def create
    @lec = Lecturer.new(lec_params)
    if @lec.save
      @lec.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @lec = Lecturer.find_by(id: params[:id])
    @students = @lec.users.assigned
    @supervising = @lec.supervising
  end

  def edit
    @lec = Lecturer.find_by(id: params[:id])
  end

  def update
    @lec = Lecturer.find_by(id: params[:id])
    if @lec.update_attributes(lec_params)
      flash[:success] = "Profile successfully updated"
      redirect_to @lec
    else
      render 'edit'
    end
  end

  def supervisor
    @supervisors = Lecturer.all
    @student = User.find_by(id: params[:user_id])
    @bid = Bid.new
    @user = User.find_by(id: params[:user_id])
  end    

  def supervising
    @title = "Students supervising"
    @user = User.find_by(id: params[:user_id])
    @supervisor = Lecturer.find_by(id: params[:id])
    @users = @supervisor.supervising
    render 'show_supervised'
  end

  private
  def lec_params
    params.require(:lecturer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def correct_lec
    @lec = Lecturer.find_by(id: params[:id])
    redirect_to(root_url) unless current_user?(@lec)
  end
end
