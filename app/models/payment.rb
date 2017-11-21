class Payment < ApplicationRecord
  belongs_to :user

  def self.month_options
    Date::MONTHNAMES.compact.each_width_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
  end

  def self.year_options
    (Date.today.year..(Date.today+10)).to_a
  end

  def process_payment
    customer = Stripe::Customer.create email: email, card: token
    Stripe::Charge.create customer: customer.id,
                          amount: 1000,
                          description: 'Premium',
                          currency: 'usd'
  end
end
