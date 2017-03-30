class Student < User
  validates :reg_no, presence: true, length: {maximum: 20}, uniqueness: true
  validates :gender, presence: true
  validates :department, presence: true
  validates :course_taken, presence: true
end
