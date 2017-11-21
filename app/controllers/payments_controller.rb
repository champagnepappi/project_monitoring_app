class PaymentsController < ApplicationController
  def new
  end

  def create
    @amount = 500
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

     Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Project Tracker Customer',
      currency: 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end
end
