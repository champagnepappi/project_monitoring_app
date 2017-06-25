class BidsController < ApplicationController
  before_action :logged_in_user

  def new 
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    student = User.find_by(id: params[:user_id])
    if @bid.save
      redirect_to users_path
      student.update_attribute(:status, "assigned")
    else
      flash[:danger] = "There was a problem assigning the student"
      redirect_to supervisor_path
    end
  end

  private
  def bid_params
    params.require(:bid).permit(:user_id, :lecturer_id)
  end
end
