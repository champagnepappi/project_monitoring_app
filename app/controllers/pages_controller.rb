class PagesController < ApplicationController
  def home
    if logged_in? && current_user?(current_user)
      @message = current_user.messages.build 
      @feed = current_user.messages
    end
  end

  def help
  end
end
