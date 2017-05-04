class BidsController < ApplicationController
  def new 
    @bid = Bid.new
  end

  private
  def bid_params
    params.require(:bid).permit(:user_id, :lecturer_id)
  end
end
