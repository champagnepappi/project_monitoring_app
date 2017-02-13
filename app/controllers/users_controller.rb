class UsersController < ApplicationController
  def new
    @user = User.new
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :reg_no, :gender, :department, :course_taken, :password, 
                                :password_confirmation)
  end
end
