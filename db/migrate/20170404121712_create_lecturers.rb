class CreateLecturers < ActiveRecord::Migration[5.0]
  def change
    create_table :lecturers do |t|

      t.timestamps
    end
  end
end
