class Payment < ApplicationRecord
  belongs_to :user

  def self.month_options
    Date::MONTHNAMES.compact.each_width_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
  end
end
