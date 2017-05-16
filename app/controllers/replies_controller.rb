class RepliesController < ApplicationController
  def create
    @reply = Reply.new(reply_params)
    if @reply.save
      flash[:success] = "Your message was successfully sent!"
      redirect_to current_lec
    else
      flash[:danger] = "There was a problem submitting message"
      redirect_to current_lec
    end
  end

  private
  def reply_params
    params.require(:reply).permit(:content)
  end

  def correct_user
    @reply = current_lec.replies.find_by(id: params[:id])
    redirect_to root_url if @reply.nil?
  end
end
