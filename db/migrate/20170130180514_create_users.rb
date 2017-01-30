class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :reg_no
      t.string :gender
      t.string :department
      t.string :course_taken

      t.timestamps
    end
  end
end
