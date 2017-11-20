class Payment < ApplicationRecord
  belongs_to :user

  def self.month_options
    Date::MONTHNAMES.compact.each_width_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
  end

  def self.year_options
    (Date.today.year..(Date.today+10)).to_a
  end
end
