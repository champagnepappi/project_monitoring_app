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
end
