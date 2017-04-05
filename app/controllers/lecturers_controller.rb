class LecturersController < ApplicationController
  def new
    @lec = Lecturer.new
  end

  private
  def lec_params
    params.require(:lecturer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
