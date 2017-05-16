class RepliesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @reply = Reply.new(reply_params)
    if @reply.save
      flash[:success] = "Your message was successfully sent!"
      redirect_to @reply.message
    else
      flash[:danger] = "There was a problem submitting message"
      redirect_to @reply.message
    end
  end

  def destroy
    @reply.destroy
    flash[:success] = "Message deleted"
    redirect_to request.referrer || root_url
  end

  private
  def reply_params
    params.require(:reply).permit(:content,:picture, :message_id, :lecturer_id)
  end

  def correct_user
    @reply = current_lec.replies.find_by(id: params[:id])
    redirect_to root_url if @reply.nil?
  end
end
