class PagesController < ApplicationController
  def home
    if logged_in?
      @message = current_user.messages.build 
      @feed = current_user.messages
    end
  end
end
