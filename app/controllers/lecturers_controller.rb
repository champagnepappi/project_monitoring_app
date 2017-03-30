class LecturersController < ApplicationController
  def new
    @lec = Lecturer.new
  end

  def create
    @lec = Lecturer.new(lec_params)
    if @lec.save
    else
      render 'new'
    end
  end

  private
  def lec_params
    params.require(:lecturer).permit(:first_name, :last_name, :password, :password_confirmation)
  end
end
