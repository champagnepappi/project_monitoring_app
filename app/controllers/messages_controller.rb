class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = "Your message was successfully sent!"
      redirect_to current_user
    else
      flash[:danger] = "There was a problem submitting message"
      redirect_to root_path
    end
  end

  def destroy
    @message.destroy
    flash[:success] = "Message deleted"
    redirect_to request.referrer || root_url
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end

  def correct_user
    @message = current_user.messages.find_by(id: params[:id])
    redirect_to root_url if @message.nil?
  end
end

