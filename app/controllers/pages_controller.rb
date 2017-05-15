class PagesController < ApplicationController
  def home
    @message = current_user.messages.build if logged_in?
    @feed = current_user.messages
  end
end
