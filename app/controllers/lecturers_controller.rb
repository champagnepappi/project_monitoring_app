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

  private
  def lec_params
    params.require(:lecturer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
