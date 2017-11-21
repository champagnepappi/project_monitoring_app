class PaymentsController < ApplicationController
  def new
  end

  def create
    @amount = 500
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
  end
end
