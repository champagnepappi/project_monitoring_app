class ReplysController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @reply = current_lec.replys.build(reply_params)
    if @reply.save
      flash[:success] = "Your reply was successfully sent"
      redirect_to current_lec
    else
      flash[:danger] = "There was a problem submitting your reply"
      redirect_to current_lec
    end
  end

  def destroy
    @reply.destroy
    flash[:success] = "Reply deleted"
    redirect_to request.referrer || root_url
  end

  private
  def reply_params
    params.require(:reply).permit(:content)
  end

  def correct_lec
    @reply = current_lec.replys.find_by(id: params[:id])
    redirect_to root_url if @reply.nil?
  end
end
