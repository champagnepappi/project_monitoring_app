class Reply < ApplicationRecord
  belongs_to :message
  belongs_to :lecturer
end
