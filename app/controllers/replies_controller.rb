class RepliesController < ApplicationController
  def create
    @reply = Reply.new(message_params)
    if @reply.save
      flash[:success] = "Your message was successfully sent!"
      redirect_to current_lec
    else
      flash[:danger] = "There was a problem submitting message"
      redirect_to current_lec
    end
  end
end
