class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = "Your message was successfully sent!"
      redirect_to current_user
    else
      flash[:danger] = "There was a problem submitting message"
      redirect_to current_user
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end

