class AddStatusToLecturers < ActiveRecord::Migration[5.0]
  def change
    add_column :lecturers, :status, :integer
  end
end
