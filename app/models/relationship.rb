class Relationship < ApplicationRecord
  belongs_to :supervisor, class_name: "Lecturer"
  belongs_to :supervised, class_name: "User"
end
