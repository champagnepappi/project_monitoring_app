class LecturersController < ApplicationController
  def new
    @lec = Lecturer.new
  end

  def create
    @lec = Lecturer.new(lec_params)
    if @lec.save
      redirect_to @lec
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
