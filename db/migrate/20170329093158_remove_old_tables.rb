class RemoveOldTables < ActiveRecord::Migration[5.0]
  def up
    Student.all.each do |s|
      User.create(first_name: s.first_name,
              last_name: s.last_name,
              email: s.email,
              reg_no: s.reg_no,
              department: s.department,
              course_taken: s.course_taken,
              password: s.password,
              password_confirmation: s.password_confirmation)
    end

    Lecturer.all.each do |l|
      User.create(first_name: l.first_name,
              last_name: l.last_name,
              email: l.email,
              password: l.password,
              password_confirmation: l.password_confirmation)
    end
    drop_table :students
    drop_table :lecturers
  end

  def down
  end
end
