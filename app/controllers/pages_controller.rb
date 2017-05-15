class PagesController < ApplicationController
  def home
    @message = current_user.messages.build if logged_in?
  end
end
