class LecturersController < ApplicationController
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

  private
  def lec_params
    params.require(:lecturer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def correct_lec
    @lec = Lecturer.find_by(id: params[:id])
    redirect_to(root_url) unless current_user?(@lec)
  end
end
